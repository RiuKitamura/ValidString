//
//  main.swift
//  ValidString
//
//  Created by M Habib Ali Akbar on 31/05/21.
//

import Foundation

func getInputString(message: String) -> String {
    
    print(message, terminator: ": ")
    return readLine() ?? ""
    
}

//MARK: - Main Logic

func isValidString(_ string: String) -> Bool {
    // short array
    let sortedString = string.lowercased().sorted(by: < )
    
    var isAllowedRemoveOneCharacter = true
    
    var charactersArrays = [[Character]]() // array of same characters of string
    
    var index = 0
    while index < sortedString.count {
        let newArray = sortedString.filter{ $0 == sortedString[index]}
        charactersArrays.append(newArray)
        index += newArray.count
    }
    
    print(charactersArrays)
    
    // get max and min of character array count
    let max = charactersArrays.map{$0.count}.max()
    let min = charactersArrays.map{$0.count}.min()
    
    // if max and min equal, it's a valid string
    if max == min {
        return true
    }
    
    for array in charactersArrays {
        if array.count == max {
            if array.count - 1 == min && isAllowedRemoveOneCharacter {
                isAllowedRemoveOneCharacter = false
            } else {
                return false
            }
        }
    }
    
    return true
}

var shuldRepeat = 1

repeat {
    
    let string = getInputString(message: "Massukkan string")
    print(isValidString(string))
    shuldRepeat = Int(getInputString(message: "Apakah anda ingin mencoba lagi? (masukkan angka 1 untuk coba lagi)")) ?? 0
    
} while shuldRepeat != 0

