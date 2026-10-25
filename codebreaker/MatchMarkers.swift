//
//  MatchMarkers.swift
//  codebreaker
//
//  Created by FITAWRARI DEJENE on 10/22/26.
//
import SwiftUI

enum Match {
    case nomatch
    case exact
    case inexact
}

struct MatchMarkers: View {
    var matches: [Match]
    var body: some View {
        if matches.count == 4 {
            VStack {
                HStack {
                    matchMarker(peg: 0)
                    matchMarker(peg: 1)
                }
                HStack {
                    matchMarker(peg: 2)
                    matchMarker(peg: 3)
                }
            }
        } else {
            EmptyView()
        }

    }

    func matchMarker(peg: Int) -> some View {
        //exact matches found
        let exactCount: Int = matches.count { $0 == .exact }
        //includes exact and in exact matches
        let foundCount: Int = matches.count { $0 != .nomatch }
        return Circle()
            .fill(exactCount > peg ? Color.primary : Color.clear, )
            .strokeBorder(
                foundCount > peg ? Color.primary : Color.red,
                lineWidth: 3
            )
            .aspectRatio(1, contentMode: .fit)
    }

}

#Preview {
    MatchMarkers(matches: [.exact, .inexact, .nomatch, .exact])
}
