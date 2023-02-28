//
//  ContentView.swift
//  WordScramble
//
//  Created by Matheus Oliveira  on 26/02/23.
//

import SwiftUI

struct ContentView: View {
//    let people = [ "Finn", "Leia", "Luke", "Rey" ]
    @State var usedWords = [String]()
    @State var rootWord = ""
    @State var newWord = ""
    
    @State var alertTitle = ""
    @State var alertMessage = ""
    @State var showingError = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .autocapitalization(.none)
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack{
                            Image(systemName: "\(word.count).circle")
                            Text("\(word)")
                        }
                    }
                }
            }
            
            .navigationTitle("\(rootWord)")
            .onSubmit(addWord)
            .onAppear(perform: startGame)
            .alert(alertTitle, isPresented: $showingError) {
                Button("Ok", role: .cancel) {}
            } message: {
                Text(alertMessage)
            }
        }
        
    }
    
    func addWord(){
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You cant just make them up, you know")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You cant spell that word")
            return
        }
            
         
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
    }
    
    func startGame(){
        if let startWords = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWords) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        
        fatalError("Could not load start.txt from bundle")
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter){
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.count)
        let mispelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return mispelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String){
        alertMessage = message
        alertTitle = title
        showingError = true
    }
//        VStack{
//        List(0..<5) {
//            Text("\($0) row")
            //            Section("Section one") {
//                Text("First row")
//                Text("Second row")
//            }
//
//            Section("Section two") {
//            }
//        VStack {
//            ForEach(people, id: \.self){
//                Text("\($0)")
//            }
//        }
//        }
//        .listStyle(.grouped)
//    }
    
//    func test() {
//        let input = """
//a
//b
//c
//"""
//        let letters = input.components(separatedBy: " ")
//        let letter = letters.randomElement()
//
//        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
//
//        let word = "swift"
//        let checker = UITextChecker()
//
//        let range = NSRange(location: 0, length: word.utf16.count)
//        let mispelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
//
//        let allGood = mispelledRange.location == NSNotFound
//    }
//
//    func loadFile() {
//        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt"){
//            if let fileContents = try? String(contentsOf: fileURL){
//            }
//        }
//    }
            
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
