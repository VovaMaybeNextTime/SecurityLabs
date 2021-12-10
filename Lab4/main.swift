//
//  main.swift
//  Lab4SecurityFinalVersion
//
//  Created by Владимир Жнакин on 10.12.2021.
//

import Foundation
import CommonCrypto


//MARK: Random Password Generator

var randomPasswords: [String] = []

extension String {

    static func random(length: Int = 7) -> String {
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString: String = ""

        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.count))
            randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
        }
        return randomString
    }
}

for _ in 0...99999{
    randomPasswords.append(String.random())
}

//for elem in randomPasswords{
//    print(elem)
//}

//MARK: Nearly Human Password Generator

var humanPasswords: [String] = []

let namePartPassword: [String] = ["VLADIMIR","Vladimir","Vova","Vovan","Vovanchik","Vovanchello","Volodya","Voldemar","Volodymyr","Vovochka"]

let numberPartPassword: [String] = ["1337","228","322","2804","2511","1125","25","11","2001","7"]

let adjectivePartPassword: [String] = ["real","simple","calm","emotional","friendly","greedy","honest","lonely","outgoing","serious"]

var fromSixtyToOneHundred: [String] = []

for _ in 0...9{
    fromSixtyToOneHundred.append(String(Int.random(in: 60...100)))
}

let cardPartPassword: [String] = ["A","K","Q","J","10","9","8","7","6","5","4","3","2"]

for a in 0...9{
    for b in 0...9{
        for c in 0...9{
            for d in 0...9{
                for e in 0...12{
                    humanPasswords.append(namePartPassword[a]+numberPartPassword[b]+adjectivePartPassword[c]+fromSixtyToOneHundred[d]+cardPartPassword[e])
                }
            }
        }
    }
}

//for elem in humanPasswords{
//    print(elem)
//}


//MARK: Top 100 Passwords

let top100Passwords = [
        "123456",
        "password",
        "12345678",
        "qwerty",
        "123456789",
        "12345",
        "1234",
        "111111",
        "1234567",
        "dragon",
        "123123",
        "baseball",
        "abc123",
        "football",
        "monkey",
        "letmein",
        "696969",
        "shadow",
        "master",
        "666666",
        "qwertyuiop",
        "123321",
        "mustang",
        "1234567890",
        "michael",
        "654321",
        "pussy",
        "superman",
        "1qaz2wsx",
        "7777777",
        "fuckyou",
        "121212",
        "000000",
        "qazwsx",
        "123qwe",
        "killer",
        "trustno1",
        "jordan",
        "jennifer",
        "zxcvbnm",
        "asdfgh",
        "hunter",
        "buster",
        "soccer",
        "harley",
        "batman",
        "andrew",
        "tigger",
        "sunshine",
        "iloveyou",
        "fuckme",
        "charlie",
        "robert",
        "thomas",
        "hockey",
        "ranger",
        "daniel",
        "starwars",
        "klaster",
        "112233",
        "george",
        "asshole",
        "computer",
        "michelle",
        "jessica",
        "pepper",
        "1111",
        "zxcvbn",
        "555555",
        "11111111",
        "131313",
        "freedom",
        "777777",
        "pass",
        "fuck",
        "maggie",
        "159753",
        "aaaaaa",
        "ginger",
        "princess",
        "joshua",
        "cheese",
        "amanda",
        "summer",
        "love",
        "ashley",
        "6969",
        "nicole",
        "chelsea",
        "biteme",
        "matthew",
        "access",
        "yankees",
        "987654321",
        "dallas",
        "austin",
        "thunder",
        "taylor",
        "matrix",
        "minecraft"
];

//print(top100Passwords.count)





//print(top100000Passwords.count)


var finalArrayOfPasswords: [String] = []

var k = 0
var l = 0

for i in 0...999999{
    if(i >= 0 && i <= 99999){
        if(i >= 100){
            k = i - (i / 100)*100
            finalArrayOfPasswords.append(top100Passwords[k])
        }
        else if(i >= 1000){
            k = i - (i / 1000)*1000
            finalArrayOfPasswords.append(top100Passwords[k])
        }
        else if(i >= 10000){
            k = i - (i / 10000)*10000
            finalArrayOfPasswords.append(top100Passwords[k])
        }
        else{
            finalArrayOfPasswords.append(top100Passwords[i])
        }
    }
    if(i >= 100000 && i <= 899999){
        if(i >= 200000){
            l = i - (i / 100000)*100000
            finalArrayOfPasswords.append(top100000Passwords[l])
        }
        else{
            finalArrayOfPasswords.append(top100000Passwords[i - 100000])
        }
    }
    if(i >= 900000 && i <= 949999){
        finalArrayOfPasswords.append(randomPasswords[i - 900000])
    }
    if(i >= 950000 && i <= 999999){
        finalArrayOfPasswords.append(humanPasswords[i - 950000])
    }
}

//for elem in finalArrayOfPasswords{
//    print(elem)
//}
//
//print(finalArrayOfPasswords.count)



extension String {
    var md5: String {
        let data = Data(self.utf8)
        let hash = data.withUnsafeBytes { (bytes: UnsafeRawBufferPointer) -> [UInt8] in
            var hash = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
            CC_MD5(bytes.baseAddress, CC_LONG(data.count), &hash)
            return hash
        }
        return hash.map { String(format: "%02x", $0) }.joined()
    }
}

extension String {
    func sha1() -> String {
        let data = Data(self.utf8)
        var digest = [UInt8](repeating: 0, count:Int(CC_SHA1_DIGEST_LENGTH))
        data.withUnsafeBytes {
            _ = CC_SHA1($0.baseAddress, CC_LONG(data.count), &digest)
        }
        let hexBytes = digest.map { String(format: "%02hhx", $0) }
        return hexBytes.joined()
    }
}

func sha256(data : Data) -> Data {
    var hash = [UInt8](repeating: 0,  count: Int(CC_SHA256_DIGEST_LENGTH))
    data.withUnsafeBytes {
        _ = CC_SHA256($0.baseAddress, CC_LONG(data.count), &hash)
    }
    return Data(hash)
}

var md5ArrayOfPasswords = finalArrayOfPasswords
var sha1ArrayOfPasswords = finalArrayOfPasswords
//var sha256ArrayOfPasswords = finalArrayOfPasswords

//for i in 0...md5ArrayOfPasswords.count - 1{
//    md5ArrayOfPasswords[i] = md5ArrayOfPasswords[i].md5
//}
//
//for elem in md5ArrayOfPasswords{
//    print(elem)
//}


for i in 0...sha1ArrayOfPasswords.count - 1{
    var randomString = String.random()
    sha1ArrayOfPasswords[i] = (sha1ArrayOfPasswords[i] + randomString).sha1() + "," + randomString
}

for elem in sha1ArrayOfPasswords{
    print(elem)
}

//let data : Data = "abcdef".data(using: .utf8)!
//
//let answer = sha256(data: data)
//
//print(answer)
//
//let str = String(data: data, encoding: .utf8)!
//print(str)

//for i in 0...sha256ArrayOfPasswords.count - 1{
//    sha256ArrayOfPasswords[i] = String(data: sha256(data: sha256ArrayOfPasswords[i].data(using: .utf8)!), encoding: .utf8)!
//    //sha256ArrayOfPasswords[i].sha1()!!!!!
//}
//
//for elem in sha256ArrayOfPasswords{
//    print(elem)
//}
