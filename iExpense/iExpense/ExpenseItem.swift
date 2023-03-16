//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Matheus Oliveira  on 14/03/23.
//

import Foundation

struct ExpenseItem: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var type: String
    var amount: Double
    var createdAt = Date()
}
