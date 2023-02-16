//
//  ContentView.swift
//  rockScissorsPaper
//
//  Created by Matheus Oliveira  on 15/02/23.
//

import SwiftUI

struct ButtonElement: View {
    let text: String
    let action: () -> Void
    
    var body: some View {
        Button(text){
            action()
        }
        .foregroundColor(.black)
        .font(.title)
        .frame(minWidth: 20, maxWidth: 100)
        .background(.white)
    }
}

struct ContentView: View {
    let elements = [ "rock", "scissor" , "paper"  ]
    
    @State var shouldWin: Bool = Bool.random()
    @State var message: String = "Draw"
    @State var show = false
    @State var tries = 7
    @State var score = 0
    @State var appElement: String = [ "rock", "scissor", "paper" ].randomElement()!
    
    func gameReset(){
        tries = 7
        score = 0
        show = false
        appElement = elements.randomElement()!
        shouldWin = Bool.random()
    }
    
    func roundReset(){
        show = false
        appElement = elements.randomElement()!
        shouldWin = Bool.random()
    }
    
    func getResult(_ userElement: String){
        let relations = [ "rock" : "scissor", "scissor" : "paper", "paper" : "rock" ]
        
        func evalRelations(_ first: String, _ sec: String){
            for rel in relations {
                let (key, value) = rel
                if key == first && value == sec {
                    score+=1
                    message = "Win"
                    break
                } else if key == sec && value == first {
                    score-=1
                    message = "Lose"
                    break
                } else {
                    message = "Draw"
                }
            }
        }
        
        if shouldWin {
            evalRelations(userElement, appElement)
        } else {
            evalRelations(appElement, userElement)
        }
        
    }
    
    func buttonTap(_ element: String){
        getResult(element)
        show = true
        tries-=1
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 10){
                Spacer()
                
                Text("Your opponent chosed")
                ZStack{
                    Text(appElement)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    Color.black
                        .opacity(show ? 0 : 1)
                }
                .frame(maxWidth: 100, maxHeight: 50)
                
                VStack{
                    Text("And you must")
                    Text(shouldWin ? "Win" : "Lose")
                        .font(.title)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                VStack{}
                    .frame(maxWidth: .infinity, maxHeight: 5)
                    .background(.white)
                
               Spacer()
                
                HStack{
                    ForEach(elements, id: \.self) { element in
                        ButtonElement(text: element){
                            buttonTap(element)
                        }
                    }
                }
                
                Spacer()
                Spacer()
            }
            .alert(message, isPresented: $show){
                if(tries == 0){
                    Button("Restart game"){
                        gameReset()
                    }
                } else {
                    Button("Continue"){
                        roundReset()
                    }
                }
            } message: {
                Text("Your score is \(score)")
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.indigo)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
