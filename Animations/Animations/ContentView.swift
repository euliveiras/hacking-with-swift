//
//  ContentView.swift
//  Animations
//
//  Created by Matheus Oliveira  on 01/03/23.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}

struct ContentView: View {
    @State var animationAmount = 1.0
    @State private var enabled = false
    @State var dragAmount = CGSize.zero
    
    let letters = Array("Hello, SwiftUI")
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
            
            if enabled {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                enabled.toggle()
            }
        }
        VStack {
            Button("tap me") {
                withAnimation {
                    enabled.toggle()
                }
            }
            
            if enabled {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
        HStack(spacing: 0) {
            ForEach(0..<letters.count) { num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .blue: .red)
                    .offset(dragAmount)
                    .animation(
                        .default.delay(Double(num) / 20),
                        value: dragAmount
                    )
            }
        }
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in
                    dragAmount = .zero
                    enabled.toggle()
                }
                
        )
            LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 300, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .offset(dragAmount)
                .gesture(
                    DragGesture()
                        .onChanged { dragAmount = $0.translation }
                        .onEnded { _ in
                            withAnimation {
                                dragAmount = .zero }
                        }
                )
        VStack {
        }
        VStack {
            Button("Tap me") {
                animationAmount += 1
            }
            
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(.red)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(
                        .easeInOut(duration: 2)
                        .repeatCount(3, autoreverses: false)
                        , value: animationAmount
                        )
                )
            .onAppear {
                animationAmount = 2
            }
//            .scaleEffect(animationAmount)
//            .blur(radius: (animationAmount - 1) * 3)
//            .animation(.default, value: animationAmount)
//            .animation(
//                .easeOut(duration: 2)
//                .repeatCount(3, autoreverses: true)
//                , value: animationAmount)
        }
        
        VStack {
            Stepper("Stepper", value: $animationAmount.animation(
                .easeInOut(duration: 1)
                .repeatCount(3, autoreverses: true)
            ), in: 0...10)
            
            Spacer()
            
            Button("tap me") {
                animationAmount += 1
            }
            
            . padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
        
        VStack {
            Button("Tap me"){
                withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                    animationAmount += 360
                }
            }
                .padding(50)
                .background(.red)
                .foregroundColor(.white)
                .clipShape(Circle())
                .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
