//
//  AddView.swift
//  iExpense
//
//  Created by Matheus Oliveira  on 14/03/23.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var expenses: Expenses
    
    
    let types = [ "Personal", "Business" ]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("name", text: $name)
                
                Picker("type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.navigationLink)
                
                TextField("amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
