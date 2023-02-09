//
//  ContentView.swift
//  wesplit
//
//  Created by Matheus Oliveira  on 09/02/23.
//

import SwiftUI

struct ContentView: View {
    @State var amount = 0.0
    @State var numberOfPeople = 2
    @State var tipAmount = 0
    
    @FocusState var isAmountFocused: Bool
    
    let localeCurrency: String = Locale.current.currency?.identifier ?? "USD"
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipAmount)

        let tipValue = amount / 100 * tipSelection
        let grandTotal = amount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var total: Double {
        let tipSelection = Double(tipAmount)
        let tipValue = amount / 100 * tipSelection
        return tipValue + amount
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $amount, format: .currency(code: localeCurrency))
                    .keyboardType(.decimalPad)
                    .focused($isAmountFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                    
                }
                
                Section {
                    Picker("Amount of tip", selection: $tipAmount) {
                        ForEach(0..<101){
                            Text("\($0)%")
                        }
                    }
                    .pickerStyle(.navigationLink)
                    
                }
                
                Section {
                        Text(totalPerPerson, format: .currency(code: localeCurrency))
                    } header: {
                        Text("Total per person")
                }
                
                Section {
                    Text(total, format: .currency(code: localeCurrency))
                } header: {
                    Text("Total")
                }
                
            }
            
            .navigationTitle("WeSplit")
            .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        
                        Button("done"){
                            isAmountFocused = false
                        }
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
