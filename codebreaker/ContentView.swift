//
//  ContentView.swift
//  codebreaker
//
//  Created by FITAWRARI DEJENE on 10/21/26.
//

import SwiftUI

struct ContentView: View {
   @State var game = CodeBreaker()

    var body: some View {
        VStack {
            view(for: game.aMasterRowOfPegs)
            view(for: game.aGuessRowOfPegs)
        }.padding()
    }

    func view(for code: ArowOfPegs) -> some View {
        HStack {
            ForEach(code.pegs.indices, id: \.self) { index in
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(code.pegs[index])
                    .aspectRatio(1, contentMode: .fit).onTapGesture {
                        if(code.kind == .guess){
                            game.changeThisPeg(at:index)
                        }
                    }

            }
            MatchMarkers(matches: [.exact, .inexact, .nomatch, .exact])

        }.padding()
    }

}

#Preview {
    ContentView()
}
