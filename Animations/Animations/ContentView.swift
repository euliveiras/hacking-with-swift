//
//  ContentView.swift
//  Animations
//
//  Created by Matheus Oliveira  on 01/03/23.
//

import SwiftUI

struct ContentView: View {
    @State var animationAmount = 1.0
    var body: some View {
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
