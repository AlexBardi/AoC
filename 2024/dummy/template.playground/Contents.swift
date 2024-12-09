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

    return answer
}

func solver2(fileContents: String) -> Int {
    var answer = 0
    
    let lines = fileContents.components(separatedBy: "\n")
    
    return answer
}

