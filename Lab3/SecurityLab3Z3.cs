using System;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace SecurityLab3Z3
{
    internal class Program
    {
        public static void Main(string[] args)
        {
            var random = new Random();
            var playerId = random.Next(9999, 999999);
            CreateAccount(playerId);
            
            var seed = DateTimeOffset.UtcNow.ToUnixTimeSeconds();
            Console.WriteLine("Seed = " + seed);
            
            MersenneTwister mt = new MersenneTwister((uint) seed);

            for (int i = 0; i < 624; i++)
            {
                mt.State[i] = (uint) FinalOperations(GameRequest(playerId, 1).Result.RealNumber);
            }
            
            

            long UnBitshiftRightXor(long value, int shift)
            {
                long i = 0;
                long resultOperation = 0;

                while (i * shift < 32)
                {
                    long buffer = -1 << (32 - shift);
                    long partMask = ConverterToIntForRightShift(buffer, (int)(shift * i));
                    var part = value & partMask;
                    value ^= ConverterToLongForRightShift(part, shift);
                    resultOperation |= part;
                    i++;
                }
                return resultOperation;
            }
            
            long UnBitshiftLeftXor(long value, int shift, long mask)
            {
                long i = 0;
                long resultOperation = 0;

                while (i * shift < 32)
                {
                    long buffer = (int)(unchecked((uint)-1) >> (32 - shift));
                    var partMask = buffer << (int)(shift * i);
                    var part = value & partMask;
                    value ^= (part << shift) & mask;
                    resultOperation |= part;
                    i++;
                }
                return resultOperation;
            }

            long ConverterToLongForRightShift(long value, int number)
            {
                return (long)((ulong)value >> number);
            }
            int ConverterToIntForRightShift(long value, int number)
            {
                return (int)((uint)value >> number);
            }

            ulong FinalOperations(long finalValue)
            {
                finalValue = UnBitshiftRightXor(finalValue, 18);
                finalValue = UnBitshiftLeftXor(finalValue, 15, 0xefc60000);
                finalValue = UnBitshiftLeftXor(finalValue, 7, 0x9d2c5680); 
                finalValue = UnBitshiftRightXor(finalValue, 11);
                return (ulong)finalValue;
            }



            var result = GameRequest(playerId, mt.GetRandomNumber()).Result.Message;

            Console.WriteLine(result);
        }
        private class MersenneTwister
        {
            private const long F = 1812433253;
            private const int M = 397;
            private const int U = 11;
            private const int S = 7;
            private const int T = 15;
            private const int L = 18;
            private const uint B = 0x9D2C5680;
            private const uint C = 0xEFC60000;

            private long _temp;
            private long _tempShift;
            private long _index = 624;
            private uint _y;

            public readonly uint[] State = new uint[624];
        
            public MersenneTwister(uint seed)
            {
                UpdateState(seed);
            }

            private void UpdateState(uint seed)
            {
                State[0] = seed;
                for (var i = 1; i < 624; i++)
                {
                    State[i] = (uint) (F * (State[i - 1] ^ State[i - 1] >> 30) + i);
                }
            }

            private void Twist()
            {
                for (var i = 0; i < 624; i++)
                {
                    _temp = (State[i] & (1 << 31)) + (State[(i + 1) % 624] & (unchecked((1 << 31) - 1)));
                    _tempShift = _temp >> 1;
                    if (_temp % 2 != 0)
                    {
                        _tempShift ^= 0x9908b0df;
                    }

                    State[i] = (uint) (State[(i + M) % 624] ^ _tempShift);
                }
                _index = 0;
            }

            public uint GetRandomNumber()
            {
                if (_index >= 624)
                {
                    Twist();
                }

                _y = State[_index];
                _y ^= (_y >> U);
                _y ^= ((_y << S) & B);
                _y ^= ((_y << T) & C);
                _y ^= (_y >> L);
                _y &= 0xFFFFFFFF;
                _index += 1;
                return _y;
            }
        }
        public struct Account
        {
            public string Id;
            public int Money;
            public string DeletionTime;
        }
            
        public struct Status
        {
            public string Message;
            public Account Account;
            public long RealNumber;
        }
        private static async void CreateAccount(int id)
        {
            var httpClient = new HttpClient();
            var request = $"http://95.217.177.249/casino/createacc?id={id}";
            var json = await httpClient.GetStringAsync(request);
        }

        private static async Task<Status> GameRequest(int id, long number)
        {
            var httpClient = new HttpClient();
            var request = $"http://95.217.177.249/casino/playBetterMt?id={id}&bet=1&number={number}";
            var json = await httpClient.GetStringAsync(request);
            var result = JsonConvert.DeserializeObject<Status>(json);
            
            return result;
        }
    }
}