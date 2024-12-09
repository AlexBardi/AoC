import UIKit
import Collections
import Foundation

if let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt") {
    do {
        var fileContents = try String(contentsOf: fileURL, encoding: .utf8)
        fileContents.removeLast() // Strip that dumb newline at the end
        print(solver1(fileContents: fileContents))
        print(solver2(fileContents: fileContents))
    } catch {
        print("Error reading file: \(error)")
    }
} else {
    print("File not found")
}

func solver1(fileContents: String) -> Int {
    var answer = 0
    
    let lines = fileContents.components(separatedBy: "\n")
    
    for line in lines {
        var numbers = line.split(separator: " ").map{ Int($0)! }
        var inc = false
        var dec = false
        var fail = false
        for x in 0...numbers.count-2 {
            var first = numbers[x]
            var second = numbers[x + 1]
            var diff = first - second
            
            if ((abs(diff) < 1) || (abs(diff) > 3)) { fail = true; break }
            
            if (diff > 0) && dec { fail = true; break }
            if (diff < 0) && inc { fail = true; break }
            
            if diff > 0 { inc = true }
            else { dec = true }
        }
        if !fail { answer += 1 }
    }

    return answer
}

func solver2(fileContents: String) -> Int {
    var answer = 0
    
    let lines = fileContents.components(separatedBy: "\n")
    
    for line in lines {
        var numbers = line.split(separator: " ").map{ Int($0)! }
        var safeVals = safeLine(numbers: numbers)
        if safeVals.Safe { answer += 1 }
        else {
            for index in safeVals.Indicies {
                if safeLine(numbers: numbers.enumerated().filter { $0.offset != index }.map { $0.element }).Safe { answer += 1; break }
            }
        }
    }

    return answer
}

func safeLine(numbers: [Int]) -> (Safe: Bool, Indicies: [Int]) {
    var inc = false
    var dec = false
    var fail = false
    var badIdx = -1
    for x in 0...numbers.count-2 {
        var first = numbers[x]
        var second = numbers[x + 1]
        var diff = first - second
        
        if ((abs(diff) < 1) || (abs(diff) > 3)) { fail = true; badIdx = x; break }
        
        if (diff > 0) && dec { fail = true; badIdx = x; break }
        if (diff < 0) && inc { fail = true; badIdx = x; break }
        
        if diff > 0 { inc = true }
        else { dec = true }
    }
    
    return (!fail, makeIdxList(badIdx: badIdx, length: numbers.count))
}

func makeIdxList(badIdx: Int, length: Int) -> [Int] {
    var badIdxList: [Int] = []
    
    if badIdx > 0 { badIdxList.append(badIdx - 1) }
    if badIdx < length - 1 { badIdxList.append(badIdx + 1) }
    badIdxList.append(badIdx)
    
    return badIdxList
}
