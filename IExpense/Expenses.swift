//
//  Expenses.swift
//  IExpense
//
//  Created by jacob aberasturi on 2/1/23.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {            
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                self.items = decodedItems
                return
            }
        }
        // If no saved data was found or it was corrupt
        self.items = [ExpenseItem]()
        
    }
}
