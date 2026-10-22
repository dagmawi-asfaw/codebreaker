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
    var body: some View {
        HStack {
            VStack {
                Circle().foregroundColor(Color.primary)
                Circle().strokeBorder(Color.primary, lineWidth: 3).aspectRatio(
                    1,
                    contentMode: .fit
                )
            }
            VStack {
                Circle().foregroundColor(Color.primary)
                Circle().foregroundColor(Color.primary)
            }
        }
    }
    
    
}

#Preview {
    MatchMarkers()
}
