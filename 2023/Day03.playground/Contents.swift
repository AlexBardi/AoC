import UIKit

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

func solver1(fileContents: String) -> String {
    let lines = fileContents.components(separatedBy: "\n")
    let var numbers: [Int] = []
    for rowIdx in 0..<lines.count {
        let row = lines[rowIdx]
        for colIdx in 0..<row.count {
            let char = row[row.index(row.startIndex, offsetBy: colIdx)]
            if char == "#" {
                return "\(rowIdx),\(colIdx)"
            }
        }
    }
    return "stuff"
}

func solver2(fileContents: String) -> String {
    let lines = fileContents.components(separatedBy: "\n")
    return "stuff"
}

