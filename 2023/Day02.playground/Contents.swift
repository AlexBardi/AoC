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
    
    let games = gamify(list: lines)
    
    var sum = 0
    for game in games {
        var valid = true
        for round in game.rounds {
           // todo
        }
        if valid == true { sum += game.id }
    }
    
    return "\(sum)"
}

func solver2(fileContents: String) -> String {
    let lines = fileContents.components(separatedBy: "\n")
    return "stuff"
}

func gamify(list: [String]) -> [Game] {
    // todo
    return []
}

struct Round {
    var red: Int
    var green: Int
    var blue: Int
}

struct Game {
    var id: Int
    var rounds: [Round]
}
