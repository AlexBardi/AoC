import UIKit

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

func solver1(fileContents: String) -> String {
    let lines = fileContents.components(separatedBy: "\n")
    return "stuff"
}

func solver2(fileContents: String) -> String {
    let lines = fileContents.components(separatedBy: "\n")
    return "stuff"
}

