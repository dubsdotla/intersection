//
//  main.swift
//  Intersection
//
//  Created by Derek William Scott on 12/12/20.
//

import Foundation

func insersection(of firstArray: [Int], and secondArray: [Int]) -> [Int] {
    
    var firstCountDict = [Int: Int]()
    var secondCountDict = [Int: Int]()
    
    for number in firstArray {
        if(firstCountDict[number] != nil) {
            firstCountDict[number]! += 1
        }
        else {
            firstCountDict[number] = 1
        }
    }
        
    for number in secondArray {
        if(secondCountDict[number] != nil) {
            secondCountDict[number]! += 1
        }
        
        else {
            secondCountDict[number] = 1
        }
    }
    
    let firstSet: Set = Set<Int>(firstArray)
    let secondSet: Set = Set<Int>(secondArray)
    let insersectSet: Set = firstSet.intersection(secondSet)
    
    var intersectArray = [Int]()
    
    for number in insersectSet {
        
        var count = 0
        
        if let firstCount = firstCountDict[number], let secondCount = secondCountDict[number] {
            
            if firstCount >= secondCount {
                count = secondCount
            }
            
            else {
                count = firstCount
            }
            
            var index = 0
            
            repeat {
                intersectArray.append(number)
                index += 1
            } while index < count
        }
    }
    
    intersectArray.sort()
        
    return intersectArray
}

print(insersection(of: [1, 2, 3, 4, 2], and: [2, 2]))
print(insersection(of: [1, 2, 3, 4, 2], and: [1, 2, 1, 2]))
print(insersection(of: [1, 1, 3, 4, 2], and: [1, 1, 6, 7]))
print(insersection(of: [1, 2, 3, 4, 2], and: [1, 2, 3]))
print(insersection(of: [1, 1, 3, 4, 2], and: [1]))
print(insersection(of: [1, 2, 3, 4], and: []))
print(insersection(of: [], and: []))


