//
//  main.swift
//  Lab1Z1
//
//  Created by Владимир Жнакин on 11.12.2021.
//

import Foundation

var resultstr = ""

var intChar = 0

let str = "7958401743454e1756174552475256435e59501a5c524e176f786517545e475f5245191772195019175e4317445f58425b531743565c521756174443455e595017d5b7ab5f525b5b58174058455b53d5b7aa175659531b17505e41525917435f52175c524e175e4417d5b7ab5c524ed5b7aa1b174f584517435f5217515e454443175b524343524517d5b7ab5fd5b7aa17405e435f17d5b7ab5cd5b7aa1b17435f5259174f584517d5b7ab52d5b7aa17405e435f17d5b7ab52d5b7aa1b17435f525917d5b7ab5bd5b7aa17405e435f17d5b7ab4ed5b7aa1b1756595317435f5259174f58451759524f4317545f564517d5b7ab5bd5b7aa17405e435f17d5b7ab5cd5b7aa175650565e591b17435f525917d5b7ab58d5b7aa17405e435f17d5b7ab52d5b7aa1756595317445817585919176e5842175a564e17424452175659175e5953524f1758511754585e59545e53525954521b177f565a5a5e595017535e4443565954521b177c56445e445c5e17524f565a5e5956435e58591b17444356435e44435e54565b17435244434417584517405f564352415245175a52435f5853174e5842175152525b174058425b5317445f584017435f52175552444317455244425b4319"


//func filterStr(str: String) -> String{
//    let valid = "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm.,"
//
//    let space: Character = " "
//
//    var filteredString = ""
//
//    for elem in str{
//        for item in valid{
//            if(elem == item) {
//                filteredString = filteredString + String(elem)
//            }
//            if(elem == space){
//                filteredString = filteredString + " "
//            }
//        }
//    }
//
//    return filteredString
//}

func filterResult(result: UInt8) -> Bool{
    if((result >= 32 && result <= 33) || (result >= 44 && result <= 46) || (result >= 58 && result <= 59) || (result >= 65 && result <= 90) || (result >= 97 && result <= 122)) || (result == 226) || (result == 156) || (result == 157) || (result == 128){
        return true
    }else{
        return false
    }
}

let characters = Array(str)

var arrayOfInts: Array<Int> = Array(repeating: 0, count: characters.count)

for i in 0...characters.count - 1{
    if characters[i] == "0"{
        intChar = 0
    }
    if characters[i] == "1"{
        intChar = 1
    }
    if characters[i] == "2"{
        intChar = 2
    }
    if characters[i] == "3"{
        intChar = 3
    }
    if characters[i] == "4"{
        intChar = 4
    }
    if characters[i] == "5"{
        intChar = 5
    }
    if characters[i] == "6"{
        intChar = 6
    }
    if characters[i] == "7"{
        intChar = 7
    }
    if characters[i] == "8"{
        intChar = 8
    }
    if characters[i] == "9"{
        intChar = 9
    }
    if characters[i] == "a"{
        intChar = 10
    }
    if characters[i] == "b"{
        intChar = 11
    }
    if characters[i] == "c"{
        intChar = 12
    }
    if characters[i] == "d"{
        intChar = 13
    }
    if characters[i] == "e"{
        intChar = 14
    }
    if characters[i] == "f"{
        intChar = 15
    }
    
    arrayOfInts[i] = intChar
}

//for elem in arrayOfInts{
//    print(elem, terminator: " ")
//}

//

for i in 0...255{
    
    var valid = true
    
    for j in stride(from: 0, through: arrayOfInts.count - 1, by: 2){
        
        valid = valid && filterResult(result: UInt8((arrayOfInts[j] * 16 + arrayOfInts[j+1]) ^ i))
        
        if filterResult(result: UInt8((arrayOfInts[j] * 16 + arrayOfInts[j+1]) ^ i)) == true {
            resultstr = resultstr + String(UnicodeScalar(UInt8((arrayOfInts[j] * 16 + arrayOfInts[j+1]) ^ i)))
        }
        
//        if (i == 55) {
//            print((arrayOfInts[j] * 16 + arrayOfInts[j+1]) ^ i)
//        }
    }
    //print("i: \(i)" +  " " + "vl:\(valid)")
    
    if valid == true{
        print(resultstr)
        
        print()
        print()
    }
    
    resultstr = ""
}


