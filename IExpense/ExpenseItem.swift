//
//  ExpenseItem.swift
//  IExpense
//
//  Created by jacob aberasturi on 2/1/23.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    // UUID makes unique hexadecimal IDs. Useful for items with same name, but should
    // still be unique
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
