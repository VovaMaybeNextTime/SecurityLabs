//
//  main.swift
//  Lab1Z2
//
//  Created by Владимир Жнакин on 11.12.2021.
//

import Foundation

let str = "G0IFOFVMLRAPI1QJbEQDbFEYOFEPJxAfI10JbEMFIUAAKRAfOVIfOFkYOUQFI15ML1kcJFUeYhA4IxAeKVQZL1VMOFgJbFMDIUAAKUgFOElMI1ZMOFgFPxADIlVMO1VMO1kAIBAZP1VMI14ANRAZPEAJPlMNP1VMIFUYOFUePxxMP19MOFgJbFsJNUMcLVMJbFkfbF8CIElMfgZNbGQDbFcJOBAYJFkfbF8CKRAeJVcEOBANOUQDIVEYJVMNIFwVbEkDORAbJVwAbEAeI1INLlwVbF4JKVRMOF9MOUMJbEMDIVVMP18eOBADKhALKV4JOFkPbFEAK18eJUQEIRBEO1gFL1hMO18eJ1UIbEQEKRAOKUMYbFwNP0RMNVUNPhlAbEMFIUUALUQJKBANIl4JLVwFIldMI0JMK0INKFkJIkRMKFUfL1UCOB5MH1UeJV8ZP1wVYBAbPlkYKRAFOBAeJVcEOBACI0dAbEkDORAbJVwAbF4JKVRMJURMOF9MKFUPJUAEKUJMOFgJbF4JNERMI14JbFEfbEcJIFxCbHIJLUJMJV5MIVkCKBxMOFgJPlVLPxACIxAfPFEPKUNCbDoEOEQcPwpDY1QDL0NCK18DK1wJYlMDIR8II1MZIVUCOB8IYwEkFQcoIB1ZJUQ1CAMvE1cHOVUuOkYuCkA4eHMJL3c8JWJffHIfDWIAGEA9Y1UIJURTOUMccUMELUIFIlc="

let hexStr = "1b420538554c2d100f2354096c44036c511838510f27101f235d096c430521400029101f39521f385918394405235e4c2f591c24551e62103823101e2954192f554c3858096c530321400029480538494c23564c3858053f100322554c3b554c3b59002010193f554c235e003510193c40093e530d3f554c20551838551e3f1c4c3f5f4c3858096c5b0935431c2d53096c591f6c5f0220494c7e064d6c64036c570938101824591f6c5f0229101e25570438100d39440321511825530d205c156c490339101b255c006c401e23520d2e5c156c5e0929544c385f4c3943096c430321554c3f5f1e3810032a100b295e0938590f6c51002b5f1e2544042110443b58052f584c3b5f1e2755086c440429100e2943186c5c0d3f444c35550d3e19406c43052145002d440928100d225e092d5c0522574c23424c2b420d28590922444c28551f2f5502381e4c1f551e255f193f5c1560101b3e591829100538101e2557043810022347406c490339101b255c006c5e0929544c25444c385f4c28550f25400429424c3858096c5e0934444c235e096c511f6c4709205c426c72092d424c255e4c215902281c4c3858093e554b3f100223101f3c510f2943426c3a0438441c3f0a436354032f43422b5f032b5c09625303211f08235319215502381f08630124150728201d5925443508032f13570739552e3a462e0a40387873092f773c25625f7c721f0d620018403d63550825445339431c7143042d42052257"

var intChar = 0

let characters = Array(hexStr)

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

arrayOfInts.count

var formHexArray: Array<Int> = Array(repeating: 0, count: arrayOfInts.count/2)
    
for j in stride(from: 0, through: arrayOfInts.count - 1, by: 2){
        
        formHexArray[j/2] = arrayOfInts[j] * 16 + arrayOfInts[j+1]
        
}

//print()
//print()
//
//for elem in formHexArray{
//    print(elem, terminator: " ")
//}

var indexOfCoincidence = 0

var arrayOfIndexOfCoincidence : Array<Int> = Array(repeating: 0, count: formHexArray.count - 1)

var sumOfIndexOfCoincidence = 0

var elementsCounter = 0

var averageNumberOfCoincidence = 0.0

var otherSumOfIndexOfCoincidence = 0

var otherElementsCounter = 0

var otherAverageNumberOfCoincidence = 0.0

//var arrayOfRatio: Array<Double> = Array(repeating: 0.0, count: arrayOfIndexOfCoincidence.count - 1)



//print()

for n in 1...formHexArray.count - 1{
    for i in 0...formHexArray.count - 1{
        
        if(i + n > formHexArray.count - 1){
            if(formHexArray[i] == formHexArray[i + n - formHexArray.count]){
                indexOfCoincidence += 1
            }
        }
        else{
            if formHexArray[i] == formHexArray[i + n] {
                indexOfCoincidence += 1
            }
        }
    }
    
    arrayOfIndexOfCoincidence[n - 1] = indexOfCoincidence
    
    //print("n: " + "\(n)" + " indexOfCoincidence: " + "\(indexOfCoincidence)")
    indexOfCoincidence = 0
}

//for item in arrayOfIndexOfCoincidence{
//    print(item, terminator: " ")
//}

//print()

for k in 1...arrayOfIndexOfCoincidence.count - 1{
    for i in 0...arrayOfIndexOfCoincidence.count - 1{
        
        if((i + 1) % k == 0){
            sumOfIndexOfCoincidence = sumOfIndexOfCoincidence + arrayOfIndexOfCoincidence[i]
            elementsCounter = elementsCounter + 1
        }
        else{
            otherSumOfIndexOfCoincidence = otherSumOfIndexOfCoincidence + arrayOfIndexOfCoincidence[i]
            otherElementsCounter = otherElementsCounter + 1
        }
    }
    averageNumberOfCoincidence = Double(sumOfIndexOfCoincidence)/Double(elementsCounter)
    
    if(otherElementsCounter == 0){
        otherAverageNumberOfCoincidence = 0
    }
    else{
        otherAverageNumberOfCoincidence = Double(otherSumOfIndexOfCoincidence)/Double(otherElementsCounter)
    }
    
    //print("averageNumberOfCoincidence " + "\(averageNumberOfCoincidence)" + " otherAverageNumberOfCoincidence " + "\(otherAverageNumberOfCoincidence)")
    if(otherAverageNumberOfCoincidence == 0){
        //arrayOfRatio[k - 1] = 0
        //print(0)
    }
    else{
        //arrayOfRatio[k - 1] = averageNumberOfCoincidence/otherAverageNumberOfCoincidence
        //print(averageNumberOfCoincidence/otherAverageNumberOfCoincidence)
    }
    
    
    sumOfIndexOfCoincidence = 0
    elementsCounter = 0
    otherSumOfIndexOfCoincidence = 0
    otherElementsCounter = 0
}

var resultstr1 = ""
var resultstr2 = ""
var resultstr3 = ""

// || (result >= 44 && result <= 46) || (result >= 58 && result <= 59) || (result >= 65 && result <= 90) || (result >= 97 && result <= 122)) || (result == 226) || (result == 156) || (result == 157) || (result == 128)

func filterResult(result: UInt8) -> Bool{
    if((result >= 32 && result <= 95) || (result >= 97 && result <= 122) || result == 10){
        return true
    }else{
        return false
    }
}

//func filterResultForSecond(result: UInt8) -> Bool{
//    if((result >= 0 && result <= 126) || (result == 226) || (result == 156) || (result == 157) || (result == 128)){
//        return true
//    }else{
//        return false
//    }
//}


var finalArray1:[Character] = []
var finalArray2:[Character] = []
var finalArray3:[Character] = []

var absolutelyFinalArray:[Character] = []

//for j in 0...2{
    for j in 0...255{

        var valid1 = true
        var valid2 = true
        var valid3 = true

        for i in 0...formHexArray.count - 1{



            if(i % 3 == 0){

                valid1 = valid1 && filterResult(result: UInt8(formHexArray[i] ^ j))

                if filterResult(result: UInt8(formHexArray[i] ^ j)) == true {
                    resultstr1 = resultstr1 + String(UnicodeScalar(UInt8(formHexArray[i] ^ j)))
                }
            }
            if(i % 3 == 1){

                valid2 = valid2 && filterResult(result: UInt8(formHexArray[i] ^ j))

                if filterResult(result: UInt8(formHexArray[i] ^ j)) == true {
                    resultstr2 = resultstr2 + String(UnicodeScalar(UInt8(formHexArray[i] ^ j)))
                }
            }
            if(i % 3 == 2){

                valid3 = valid3 && filterResult(result: UInt8(formHexArray[i] ^ j))

                if filterResult(result: UInt8(formHexArray[i] ^ j)) == true {
                    resultstr3 = resultstr3 + String(UnicodeScalar(UInt8(formHexArray[i] ^ j)))
                }
            }

        }
        if valid1 == true{
            //print(resultstr1.count)
//            print()
//            print()
            
            let finalStr1 = Array(resultstr1)

//            for elem in finalStr1{
//                print(elem,terminator: "")
//            }
            //print()
            //print()
            
            finalArray1 = finalStr1
        }
        
        if valid2 == true{
//            print(resultstr)
//            print()
//            print()
            
            let finalStr2 = Array(resultstr2)

//            for elem in finalStr2{
//                print(elem,terminator: "")
//            }
            //print()
            //print()
            
            finalArray2 = finalStr2
        }
        
        if valid3 == true{
//            print(resultstr)
//            print()
//            print()
            
            let finalStr3 = Array(resultstr3)

//            for elem in finalStr3{
//                print(elem,terminator: "")
//            }
            //print()
            //print()
            
            finalArray3 = finalStr3
        }
        
        resultstr1 = ""
        resultstr2 = ""
        resultstr3 = ""
    }

for i in 0...formHexArray.count - 1{
    if(i % 3 == 0){
        absolutelyFinalArray.append(finalArray1[i/3])
    }
    if(i % 3 == 1){
        absolutelyFinalArray.append(finalArray2[i/3])
    }
    if(i % 3 == 2){
        absolutelyFinalArray.append(finalArray3[i/3])
    }
}

for elem in absolutelyFinalArray{
    print(elem, terminator: "")
}
