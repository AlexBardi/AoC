import UIKit

var greeting = "Hello, playground"

import Foundation

if let fileURL = Bundle.main.url(forResource: "input02", withExtension: "txt") {
    do {
        let fileContents = try String(contentsOf: fileURL, encoding: .utf8)
        print(solver(fileContents: fileContents))
    } catch {
        print("Error reading file: \(error)")
    }
} else {
    print("File not found")
}

func solver(fileContents: String) -> String {
    let lines = fileContents.components(separatedBy: "\n")
    return "stuff"
}
