//
//  ContentView.swift
//  WordScramble
//
//  Created by Matheus Oliveira  on 26/02/23.
//

import SwiftUI

struct ContentView: View {
    let people = [ "Finn", "Leia", "Luke", "Rey" ]
    var body: some View {
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
        VStack {
            ForEach(people, id: \.self){
                Text("\($0)")
            }
        }
//        }
//        .listStyle(.grouped)
//    }
        }
    
    func test() {
        let input = """
a
b
c
"""
        let letters = input.components(separatedBy: " ")
        let letter = letters.randomElement()
        
        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let word = "swift"
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        let mispelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        let allGood = mispelledRange.location == NSNotFound
    }
    
    func loadFile() {
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt"){
            if let fileContents = try? String(contentsOf: fileURL){
            }
        }
    }
            
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
