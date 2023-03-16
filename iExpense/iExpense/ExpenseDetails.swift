//
//  ExpenseDetails.swift
//  iExpense
//
//  Created by Matheus Oliveira  on 15/03/23.
//

import SwiftUI

struct ExpenseDetails: View {
    @ObservedObject var expenses: Expenses
    
    @State var name: String
    @State var amount: Double
    @State var type: String
    var createdAt: Date
    var id: UUID
    
    @Environment(\.dismiss) var dismiss
    
    let types = [ "Personal", "Business" ]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("name", text: $name)
                TextField("amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
                
                Picker("type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text("\($0)")
                    }
                }
                
                HStack {
                    Text("Created at: ")
                    Text(createdAt, format: .dateTime.day(.twoDigits).month(.wide))
                }
                
                .pickerStyle(.navigationLink)
            }
            .navigationTitle("Detail")
            
            Button("Edit", action: editExpense)
        }
    }
    
    func editExpense(){
        if let index = expenses.items.firstIndex(where: { $0.id == id }) {
            expenses.items[index].name = name
            expenses.items[index].type = type
            expenses.items[index].amount = amount
            
            dismiss()
        }
    }
}

struct ExpenseDetails_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseDetails(expenses: Expenses(), name: "", amount: 0.0, type: "Personal", createdAt: Date(), id: UUID())
    }
}
