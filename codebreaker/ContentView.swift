//
//  ContentView.swift
//  codebreaker
//
//  Created by FITAWRARI DEJENE on 10/21/26.
//

import SwiftUI

struct MoreContentView: View {
    var body: some View {

    }
}

struct ContentView: View {

    var body: some View {
        VStack {
            pegs(colors: [.red, .blue, .green, .yellow])
            pegs(colors: [.red, .blue, .yellow, .yellow])
            pegs(colors: [.red, .red, .green, .yellow])
            pegs(colors: [.blue, .blue, .green, .yellow])

        }.padding()
    }

     
    func pegs(colors: [Color]) -> some View {
        if(colors.count == 4 ){
            HStack {
                ForEach(colors.indices, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 10).foregroundColor(
                        colors[index]
                    ).aspectRatio(1, contentMode: .fit)

                }
                MatchMarkers(matches: [.exact, .inexact, .nomatch,.exact])

            }.padding()
        }
        else {
               EmptyView()
            }
        
     
    }
}

#Preview {
    ContentView()
}
