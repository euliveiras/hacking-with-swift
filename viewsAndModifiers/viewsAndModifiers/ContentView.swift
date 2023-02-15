//
//  ContentView.swift
//  viewsAndModifiers
//
//  Created by Matheus Oliveira  on 13/02/23.
//

import SwiftUI

struct GridStack<Content: View>: View {
    var rows = 3
    var cols = 3
    
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack{
                ForEach(0..<cols, id: \.self) { col in
                    content(row, col)
                }
                }
            }
        }
    }
}

struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(.blue)
            .clipShape(Capsule())
    }
}

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottom){
            content
            
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
    
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct ContentView: View {
    @State var number = 0
    
    var num: some View {
       Text("Number: \(number)")
    }
    
    var square: some View {
        Text("\(number) x \(number) = \(number * number)")
    }
    
    @ViewBuilder var text: some View {
        num
        square
    }
    
    var body: some View {
            GridStack(rows: 5, cols: 5) {row,col in
                Text("\(row)x\(col)")
            }
        VStack {
            Spacer()
            Button("Tap me") {
                 number+=1
            }
            text
            Spacer()
            
            CapsuleText(text: "First")
                .foregroundColor(.white)
            CapsuleText(text: "Second")
                .foregroundColor(.purple)
            
            Spacer()
            
            Color.blue
                .frame(width: 200, height: 200)
                .watermarked(with: "euliveiras")
            
            Text("footer")
                .titleStyle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
