//
//  ContentView.swift
//  guess-the-flag
//
//  Created by Matheus Oliveira  on 10/02/23.
//

import SwiftUI

struct ContentView: View {
    @State var isShowingAlert = false
    
    var body: some View {
        VStack(spacing: 5) {
            Color.pink
            Text("This is VStack")
            Text("Lorem ipsum dolor")
            HStack(spacing: 20) {
                Color(red: 1, green: 0.8, blue: 0)
                Text("This is Hstack")
                Text("Lorem ipsum dolor")
            }
            Spacer()
            
            Section {
                HStack {
                    Text("1")
                    Text("2")
                    Text("3")
                }
                HStack {
                    Text("2")
                    Text("3")
                    Text("4")
                }
                HStack {
                    Text("3")
                    Text("4")
                    Text("5")
                }
                
            } header: {
                Text("Grid")
                Color.primary
                    .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 5)
            }
            
            Spacer()
            
            ZStack {
                VStack(spacing: 0){
                    Color.pink
                    Color.indigo
                }
// ZStack draws from top to bottom
                Text("From ZStack")
//                    .foregroundColor(.secondary)
                    .foregroundStyle(.secondary)
                    .padding(50)
                    .background(.ultraThinMaterial)
            }
        }
        .ignoresSafeArea()
        
        VStack {
            LinearGradient(gradient: Gradient(stops: [
                .init(color: .white, location: 0.45),
                .init(color: .black, location: 0.55)
            ]), startPoint: .top, endPoint: .bottom)
        }
        
        .ignoresSafeArea()
        
        VStack {
            RadialGradient(gradient: .init(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
        }
        
        .ignoresSafeArea()
        
        VStack {
            AngularGradient(gradient: .init(colors: [.red, .green, .yellow, .blue, .purple]), center: .center)
        }
        
        .ignoresSafeArea()
        
        VStack{
            Button("Delete", role: .destructive, action: delete)
                .buttonStyle(.bordered)
            
            Button("Button2") {
                
            }
            .buttonStyle(.bordered)
            
            Button {
                isShowingAlert = true
            } label: {
                Label("Edit", systemImage: "trash")
                    .padding(8)
            } .alert("Delete", isPresented: $isShowingAlert) {
                Button("Delete", role: .destructive) {}
            } message: {
                Text("Something was deleted")
            }
                .buttonStyle(.borderedProminent)
                .tint(.indigo)
            Button("Button4", role: .destructive) {}
                .buttonStyle(.borderedProminent)
        }
        
    }
    
    func delete() {
        print("Deleted")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
