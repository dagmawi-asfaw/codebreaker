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
    
    
    var horizontalShi: some View = HStack{
        Text("this is some horizontal shit").font(.title3)
        Image(systemName:       "heart.fill").foregroundColor(.blue)
    }
    

    
    var verticalShi: some View = VStack{   Image(systemName: "heart.fill").foregroundColor(.red)
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("this is some vertical shi").font(.title2)
    }
    
    var body: some View {
        verticalShi
        horizontalShi
    }
}

#Preview {
    ContentView()
}
