//
//  CodeBreaker.swift
//  codebreaker
//
//  Created by FITAWRARI DEJENE on 10/26/26.
//

import SwiftUI

typealias Peg = Color

struct CodeBreaker {
    //the answer
    var aMasterRowOfPegs = Code(kind: .master)
    // an attempt
    var aGuessRowOfPegs = Code(kind: .guess)
    //list of previous attemps
    var attempts = [Code]()
    // list of color options
    let pegChoices: [Peg] = [.green, .red, .blue, .yellow]

    // var matches:[Match]{
    //     switch kind{
    //     case
    //     }
    // }

    mutating func attemptGuess() {
        var attempt = aGuessRowOfPegs
        attempt.kind = .attempt(<#T##[Match]#>)
        attempts.append(attempt)
    }

    mutating func changeThisPeg(at index: Int) {
        //the color of that peg that was already there
        var existingPeg = aGuessRowOfPegs.pegs[index]

        //get the peg aka color of the clicked on peg
        //if its not nil
        if var indexOfExistingPegInPegChoices = pegChoices.firstIndex(
            of: existingPeg
        ) {
            //get the peg aka color of the next peg index
            // replace that existing peg with the new peg/color
            aGuessRowOfPegs.pegs[index] =
                pegChoices[
                    (indexOfExistingPegInPegChoices + 1) % pegChoices.count
                ]
        } else {
            // if it doesnt exist then set it to clear
            // why would it be missing? when its starting all are set to clear
            aGuessRowOfPegs.pegs[index] = pegChoices.first ?? Code.missing
        }
    }
}

struct Code {
    var kind: Kind
    var pegs: [Peg] = Array(
    
    static let missing: Peg = .clear

    enum Kind: Equatable {
        case master
        case guess
        case attempt([Match])
        case unknown
    }
    
    var matches:[Match]{
        switch kind{
        case .attempt(let matches): return matches
        default: return []
        }
    }

    func match(against otherCode: Code) -> [Match] {
        var results: [Match] = Array(
            repeating: .nomatch,
            count: pegs.count
        )

        var pegsToMatch = otherCode.pegs
        for index in pegs.indices.reversed() {
            if pegsToMatch.count > index,
                pegsToMatch[index] == pegs[index]
            {
                results[index] = .exact
                pegsToMatch.remove(at: index)
            }
        }
        for index in pegs.indices {
            if results[index] != .exact {
                if let matchIndex = pegsToMatch.firstIndex(
                    of: pegs[index]
                ) {
                    results[index] = .inexact
                    pegsToMatch.remove(at: matchIndex)
                }
            }
        }
        return results
    }

}
