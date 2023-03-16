//
//  ContentView.swift
//  iExpense
//
//  Created by Matheus Oliveira  on 13/03/23.
//

import SwiftUI

class User: ObservableObject {
    @Published public var firstName = "Bilbo"
    @Published public var lastName = "Baggins"
}

struct Rows: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(numbers, id: \.self) {
                    Text("Row \($0)")
                }
                .onDelete(perform: removeRow)
                
                Button("Add row"){
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .navigationTitle("onDelete()")
            .toolbar {
                EditButton()
            }
        }
    }
    
    func removeRow(at offSets: IndexSet){
        numbers.remove(atOffsets: offSets)
    }
}

struct SecondView: View {
    var name: String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            Text("Hello, \(name)")
        
            Button("Dismiss"){
                dismiss()
            }
        }
    }
}

struct UserSettings: Codable {
    var firstName: String
    var lastName: String
}

struct Item: View {
    @ObservedObject var user: User
    
    var body: some View {
        Text("\(user.firstName) \(user.lastName)")
    }
}

struct UserDefaultEx: View {
    @AppStorage("Tap") var tapCount = 0

    var body: some View {
        Button("Tap count: \(tapCount)"){
            tapCount += 1
        }
    }
}

struct Anotations: View {
    @StateObject var user = User()
    @State var showSheet = false
    @State private var userSettings = UserSettings(firstName: "Matheus", lastName: "Oliveira")
    var body: some View {
        VStack {
            Button("Saver user"){
                let encoder = JSONEncoder()
                
                if let data = try? encoder.encode(userSettings){
                    UserDefaults.standard.set(data, forKey: "User")
                }
            }
        }
        VStack {
            UserDefaultEx()
        }
        VStack {
            Text("\(user.firstName) \(user.lastName)")
                .font(.largeTitle)
            
            HStack(alignment: .center, spacing: 0){
                TextField("First name", text: $user.firstName)
                TextField("Last name", text: $user.lastName)
                    .frame(width: 200, height: 200)
            }
            
            HStack {
                Button("show the sheet"){
                    showSheet = true
                }
                .sheet(isPresented: $showSheet){
                    SecondView(name: "@euliveiras")
                }
            }
            
            Spacer()
            Item(user: user)
        }
        
        VStack{
            Rows()
        }
    }
}

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    private var personalExpenses: [ExpenseItem] {
        expenses.items.filter { $0.type == "Personal" }
    }
    
    private var businessExpenses: [ExpenseItem] {
        expenses.items.filter { $0.type == "Business" }
    }
    
    var body: some View {
        NavigationStack{
            List {
                Text("Personal")
                    .font(.largeTitle)
                ForEach(personalExpenses) { item in
                    NavigationLink {
                        ExpenseDetails(expenses: expenses, name: item.name, amount: item.amount, type: item.type, createdAt: item.createdAt, id: item.id)
                    } label: {
                        HStack {
                            VStack(alignment: .leading){
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            
                            Spacer()
                            
                            if item.amount > 100 {
                                Text(item.amount, format: .currency(code: "USD"))
                                    .foregroundColor(.red)
                            } else if item.amount > 10 {
                                Text(item.amount, format: .currency(code: "USD"))
                                    .foregroundColor(.orange)
                            } else {
                                Text(item.amount, format: .currency(code: "USD"))
                                    .foregroundColor(.yellow)
                            }
                        }
                    }
                }
                .onDelete(perform: removePersonalItems)
            }
                
            List {
                Text("Business")
                    .font(.largeTitle)
                ForEach(businessExpenses) { item in
                    NavigationLink {
                        ExpenseDetails(expenses: expenses, name: item.name, amount: item.amount, type: item.type, createdAt: item.createdAt, id: item.id)
                    } label: {
                        HStack {
                            VStack(alignment: .leading){
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            
                            Spacer()
                            
                            if item.amount > 100 {
                                Text(item.amount, format: .currency(code: "USD"))
                                    .foregroundColor(.red)
                            } else if item.amount > 10 {
                                Text(item.amount, format: .currency(code: "USD"))
                                    .foregroundColor(.orange)
                            } else {
                                Text(item.amount, format: .currency(code: "USD"))
                                    .foregroundColor(.yellow)
                            }
                        }
                    }
                }
                
                .onDelete(perform: removeBusinessItems)
            }
            
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense){
                AddView(expenses: expenses)
            }
        }
    }
    func removePersonalItems(at offSets: IndexSet) {
        offSets.forEach { (i) in
            let item = personalExpenses[i]
            if let i = expenses.items.firstIndex(where: { $0.id == item.id }) {
                expenses.items.remove(at: i)
            }
        }
    }
    func removeBusinessItems(at offSets: IndexSet) {
        offSets.forEach { (i) in
            let item = businessExpenses[i]
            if let i = expenses.items.firstIndex(where: { $0.id == item.id }) {
                expenses.items.remove(at: i)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
