//
//  ContentView.swift
//  guess-the-flag
//
//  Created by Matheus Oliveira  on 10/02/23.
//

import SwiftUI

struct FlagImage: View {
    var flag: String
    var body: some View {
        Image(flag)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State var isShowingAlert = false
    
    @State var showingScore = false
    @State var scoreTitle = ""
    @State var score = 0
    @State var numberOfTries = 0
    @State var hasExceedNumberOfTries = false
    
    @State var countries = [ "Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        VStack {
            ZStack {
                RadialGradient(stops: [
                    .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                    .init(color: Color(red: 0.76, green: 0.15, blue: 0.16), location: 0.3)
                ], center: .top, startRadius: 200, endRadius: 700)
                    .ignoresSafeArea()
                
                VStack{
                    Spacer()
                    
                    Text("Guess the flag")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                    
                    VStack(spacing: 15){
                        VStack{
                           Text("Tap the flag of:")
                                .foregroundStyle(.secondary)
                                .font(.subheadline.weight(.heavy))
                            Text(countries[correctAnswer])
                                .font(.largeTitle.weight(.semibold))
                        }
                        ForEach(0..<3) { number in
                            Button {
                                flagTapped(number)
                                
                            } label: {
                                FlagImage(flag: countries[number])
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    Spacer()
                    Spacer()
                    
                    Text("Your score is \(score)")
                        .foregroundColor(.white)
                        .font(.title.bold())
                    
                    Spacer()
                }
                .padding()
            }
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                Text("You score is \(score)")
            }
            
            .alert("Game is over", isPresented: $hasExceedNumberOfTries){
                Button("Restart") {
                    score = 0
                    countries.shuffle()
                    hasExceedNumberOfTries = false
                }
            } message: {
                Text("Your score was \(score)")
            }
        }
//        VStack(spacing: 5) {
//            Color.pink
//            Text("This is VStack")
//            Text("Lorem ipsum dolor")
//            HStack(spacing: 20) {
//                Color(red: 1, green: 0.8, blue: 0)
//                Text("This is Hstack")
//                Text("Lorem ipsum dolor")
//            }
//            Spacer()
//
//            Section {
//                HStack {
//                    Text("1")
//                    Text("2")
//                    Text("3")
//                }
//                HStack {
//                    Text("2")
//                    Text("3")
//                    Text("4")
//                }
//                HStack {
//                    Text("3")
//                    Text("4")
//                    Text("5")
//                }
//
//            } header: {
//                Text("Grid")
//                Color.primary
//                    .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 5)
//            }
//
//            Spacer()
//
//            ZStack {
//                VStack(spacing: 0){
//                    Color.pink
//                    Color.indigo
//                }
//// ZStack draws from top to bottom
//                Text("From ZStack")
////                    .foregroundColor(.secondary)
//                    .foregroundStyle(.secondary)
//                    .padding(50)
//                    .background(.ultraThinMaterial)
//            }
//        }
//        .ignoresSafeArea()
//
//        VStack {
//            LinearGradient(gradient: Gradient(stops: [
//                .init(color: .white, location: 0.45),
//                .init(color: .black, location: 0.55)
//            ]), startPoint: .top, endPoint: .bottom)
//        }
//
//        .ignoresSafeArea()
//
//        VStack {
//            RadialGradient(gradient: .init(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
//        }
//
//        .ignoresSafeArea()
//
//        VStack {
//            AngularGradient(gradient: .init(colors: [.red, .green, .yellow, .blue, .purple]), center: .center)
//        }
//
//        .ignoresSafeArea()
//
//        VStack{
//            Button("Delete", role: .destructive, action: delete)
//                .buttonStyle(.bordered)
//
//            Button("Button2") {
//
//            }
//            .buttonStyle(.bordered)
//
//            Button {
//                isShowingAlert = true
//            } label: {
//                Label("Edit", systemImage: "trash")
//                    .padding(8)
//            } .alert("Delete", isPresented: $isShowingAlert) {
//                Button("Delete", role: .destructive) {}
//            } message: {
//                Text("Something was deleted")
//            }
//                .buttonStyle(.borderedProminent)
//                .tint(.indigo)
//            Button("Button4", role: .destructive) {}
//                .buttonStyle(.borderedProminent)
//        }
//
    }
//
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score+=1
        } else {
            scoreTitle = "Wrong! This is the flag of \(countries[number])"
        }
        numberOfTries+=1
        let num = getNumberOfTries()
        if(num<8){
            showingScore = true
        }
    }

    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0..<2)
    }
    
    func getNumberOfTries() -> Int{
        if(numberOfTries >= 8){
         hasExceedNumberOfTries = true
        }
        return numberOfTries
    }
//
//    func delete() {
//        print("Deleted")
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
