import UIKit
import Foundation
import RegexBuilder

var greeting = "Hello, playground"

print(greeting)

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
        if game.redMax > 12 { continue }
        if game.greenMax > 13 { continue }
        if game.blueMax > 14 { continue }
        sum += game.id
    }
    
    return "\(sum)"
}

func solver2(fileContents: String) -> String {
    let lines = fileContents.components(separatedBy: "\n")
    return "stuff"
}

func gamify(list: [String]) -> [Game] {
    var games: [Game] = []
    let idRef = Reference(Int.self)
    let roundsRef = Reference(Substring.self)
    let idVsRounds = Regex {
        "Game "
        TryCapture(as: idRef) {
            OneOrMore(.digit)
        } transform: { match in
            Int(match)
        }
        ":"
        Capture(as: roundsRef) {
            OneOrMore(.any)
        }
    }
    
    for line in list {
        print(line)
        if let result = line.firstMatch(of: idVsRounds) {
            games.append(gameMaker(id: result[idRef], rounds: String(result[roundsRef])))
        } else {
            print("😭")
        }
    }
    
    return games
}

func gameMaker(id: Int, rounds: String) -> Game {
    var roundList: [Round] = []
    var redMax = 0
    var greenMax = 0
    var blueMax = 0
    let roundStringList = rounds.components(separatedBy: "; ")
    
    let colorRef = Reference(Substring.self)
    let numberRef = Reference(Int.self)
    
    let colorSearch = Regex {
        TryCapture(as: numberRef) {
            OneOrMore(.digit)
        } transform: { match in
            Int(match)
        }
        " "
        Capture(as: colorRef) {
            OneOrMore(.word)
        }
        ZeroOrMore {
            ", "
        }
    }
    
    for roundString in roundStringList {
        print(roundString)
        var red = 0
        var green = 0
        var blue = 0
        for match in roundString.matches(of: colorSearch) {
            print(match.output)
            print(match[colorRef])
            print(match[numberRef])
            switch match[colorRef] {
                case "red":   red = match[numberRef]
                case "green": green = match[numberRef]
                case "blue":  blue = match[numberRef]
                default: print("Error, color not recognized")
            }
            
            roundList.append(Round(red: red, green: green, blue: blue))
            redMax = red > redMax ? red : redMax
            greenMax = green > greenMax ? green : greenMax
            blueMax = blue > blueMax ? blue : blueMax
        }
    }
    return Game(id: id, rounds: roundList, redMax: redMax, greenMax: greenMax, blueMax: blueMax)
}

struct Round {
    var red: Int
    var green: Int
    var blue: Int
}

struct Game {
    var id: Int
    var rounds: [Round]
    var redMax: Int
    var greenMax: Int
    var blueMax: Int
}
