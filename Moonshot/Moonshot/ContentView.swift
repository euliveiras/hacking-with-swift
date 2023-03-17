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

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
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
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120)),
    ]
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout) {
                    ForEach(0..<1000){
                        Text("\($0)")
                    }
            }
            
        }
        VStack {
            ScrollView {
                LazyVGrid(columns: layout) {
                    ForEach(0..<1000){
                        Text("\($0)")
                    }
                }
            }
        }
        HStack {
            Button("Tap me") {
                let input = """
                    {
                        "name": "Taylor Swift",
                        "address": {
                            "street": "555 Taylor Swift avenue",
                            "city": "Nashville"
                        }
                    }
                """
                
                let data = Data(input.utf8)
                if let user = try? JSONDecoder().decode(User.self, from: data) {
                    print(user.address.street)
                }
            }
        }
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
