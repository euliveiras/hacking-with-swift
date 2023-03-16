//
//  ContentView.swift
//  Moonshot
//
//  Created by Matheus Oliveira  on 16/03/23.
//

import SwiftUI

struct GeometryReaderExample: View {
    var body: some View {
        GeometryReader { geo in
            Image("Example")
                .resizable()
                .scaledToFit()
                .frame(width: geo.size.width * 0.8, height: 300)
                .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ string: String) {
        self.text = string
        print(string)
    }
}

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(0..<100) {
                    CustomText("Row \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
