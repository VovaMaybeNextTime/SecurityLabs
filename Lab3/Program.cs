using System;
using System.Net.Http;
//using System.Text.Json.Serialization;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace SecurityLab3Z2
{
    internal class Program
    {
        public static void Main(string[] args)
        {
            var random = new Random();
            var playerId = random.Next(9999, 9999999);
            CreateAccount(playerId);

            // var result1 = GameRequest(playerId, 1).Result.RealNumber;
            // var result2 = GameRequest(playerId, 1).Result.RealNumber;
            // var result3 = GameRequest(playerId, 1).Result.RealNumber;

            // Console.WriteLine(result1);
            // Console.WriteLine(result2);
            // Console.WriteLine(result3);
            
            
            
            //var response = $"http://95.217.177.249/casino/createacc?id={playerId}";

            //Console.WriteLine(response);

            var seed = DateTimeOffset.UtcNow.ToUnixTimeSeconds();
            Console.WriteLine("Seed = " + seed);
            //Console.WriteLine(seed);

            MersenneTwister mt = new MersenneTwister((uint) seed);
            
            var result = GameRequest(playerId, mt.GetRandomNumber()).Result.Message;

            Console.WriteLine(result);
            
            // Console.WriteLine(mt.GetRandomNumber());
            // Console.WriteLine(mt.GetRandomNumber());
            // Console.WriteLine(mt.GetRandomNumber());
            // Console.WriteLine(mt.GetRandomNumber());
            // Console.WriteLine(mt.GetRandomNumber());
            // Console.WriteLine(mt.GetRandomNumber());
            // Console.WriteLine(mt.GetRandomNumber());
            // Console.WriteLine(mt.GetRandomNumber());
            // Console.WriteLine(mt.GetRandomNumber());
            // Console.WriteLine(mt.GetRandomNumber());
            // Console.WriteLine(mt.GetRandomNumber());
            
            
            
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

        private readonly uint[] _state = new uint[624];
        
        public MersenneTwister(uint seed)
        {
            UpdateState(seed);
        }

        private void UpdateState(uint seed)
        {
            _state[0] = seed;
            for (var i = 1; i < 624; i++)
            {
                _state[i] = (uint) (F * (_state[i - 1] ^ _state[i - 1] >> 30) + i);
            }
        }

        private void Twist()
        {
            for (var i = 0; i < 624; i++)
            {
                _temp = (_state[i] & (1 << 31)) + (_state[(i + 1) % 624] & (unchecked((1 << 31) - 1)));
                _tempShift = _temp >> 1;
                if (_temp % 2 != 0)
                {
                    _tempShift ^= 0x9908b0df;
                }

                _state[i] = (uint) (_state[(i + M) % 624] ^ _tempShift);
            }
            _index = 0;
        }

        public uint GetRandomNumber()
        {
            if (_index >= 624)
            {
                Twist();
            }

            _y = _state[_index];
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
            var request = $"http://95.217.177.249/casino/playMt?id={id}&bet=1000&number={number}";
            var json = await httpClient.GetStringAsync(request);
            var result = JsonConvert.DeserializeObject<Status>(json);
            
            return result;
        }
    }
}