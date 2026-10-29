//
//  ContentView.swift
//  codebreaker
//
//  Created by FITAWRARI DEJENE on 10/21/26.
//

import SwiftUI

struct CodeBreakerContentView: View {
    @State var game = CodeBreaker()

    var body: some View {
        ScrollView {
            VStack {
                view(for: game.aMasterRowOfPegs)
                view(for: game.aGuessRowOfPegs)

                ForEach(game.attempts.indices.reversed(), id: \.self) { index in
                    view(for: game.attempts[index])
                }
                Button("Guess") {
                    withAnimation {
                           game.()
                    }

                }
            }.padding()
        }

    }

    func view(for code: Code) -> some View {
        HStack {
            ForEach(code.pegs.indices, id: \.self) { index in
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(code.pegs[index])
                    .aspectRatio(1, contentMode: .fit).onTapGesture {
                        if code.kind == .guess {
                            game.changeThisPeg(at: index)
                        }
                    }

            }
            MatchMarkers(
                matches: game.aGuessRowOfPegs.match(
                    against: game.aMasterRowOfPegs
                )
            )

        }.padding()
    }

}

#Preview {
    CodeBreakerContentView()
}
