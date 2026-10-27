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
    var aMasterRowOfPegs = ArowOfPegs(kind: .master)
    // an attempt
    var aGuessRowOfPegs = ArowOfPegs(kind: .guess)
    //list of previous attemps
    var attempts = [ArowOfPegs]()
    // list of color options
    let pegChoices: [Peg] = [.green, .red, .blue, .yellow]

    mutating func changeThisPeg(at index: Int) {
        //the color of that peg that was already there
        let existingPeg = aGuessRowOfPegs.pegs[index]

        //get the peg aka color of the clicked on peg
        let indexOfExistingPegInPegChoices = pegChoices.firstIndex(
            of: existingPeg
        )
        
        //if it exists..cuz the method is optional
        if indexOfExistingPegInPegChoices != nil {

            //go to the next color
            var newIndex = (indexOfExistingPegInPegChoices ?? 0) + 1
            //if at the end return to 0
            if newIndex == 4 {
                newIndex = 0
            }
            //get the peg aka color of the next peg index
            let newPeg = pegChoices[newIndex]
            
            // replace that existing peg with the new peg/color
            aGuessRowOfPegs.pegs[index] = newPeg
        } else {
            // if it doesnt exist then set it to clear
            // why would it be missing tho idk could be error handling
            aGuessRowOfPegs.pegs[index] = pegChoices.first ?? ArowOfPegs.missing
        }
    }
}

struct ArowOfPegs {
    var kind: Kind
    var pegs: [Peg] = [.green, .red, .red, .yellow]
    static let missing: Peg = .clear
    enum Kind {
        case master
        case guess
        case attempt
        case unknown
    }

}
