import UIKit
import Collections

var greeting = "Hello, playground"

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
    let lines = fileContents.components(separatedBy: "\n")
    
    var leftHeap: Heap<Int> = []
    var rightHeap: Heap<Int> = []
    
    for line in lines {
        let numbers = line.split(separator: " ")
        
        leftHeap.insert(Int(numbers[0])!)
        rightHeap.insert(Int(numbers[1])!)
    }
    
    var sumDiff: Int = 0
    
    while let minLeft = leftHeap.popMin() {
        let minRight = rightHeap.popMin()!
        sumDiff += abs(minLeft - minRight)
    }

    return sumDiff
}

func solver2(fileContents: String) -> Int {
    let lines = fileContents.components(separatedBy: "\n")
    
    var leftSet = Set<Int>()
    var rightList = [Int]()
    
    for line in lines {
        let numbers = line.split(separator: " ")
        leftSet.insert(Int(numbers[0])!)
        rightList.append(Int(numbers[1])!)
    }
    
    var sum = 0
    
    for number in rightList {
        if leftSet.contains(number) {
            sum += number
        }
    }
    return sum
}

