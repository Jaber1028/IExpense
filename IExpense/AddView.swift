//
//  AddView.swift
//  IExpense
//
//  Created by jacob aberasturi on 2/1/23.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Expenses
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    var types = ["Personal", "Business"]
    
    var currencyFormat: FloatingPointFormatStyle<Double>.Currency {
        return .currency(code: Locale.current.currency?.identifier ?? "USD")
    }
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Expense type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                } .pickerStyle(.segmented)
                
                TextField("Amount", value: $amount, format: currencyFormat).keyboardType(.decimalPad)
                
            }
                .navigationTitle("Enter your Expense")
                .toolbar {
                    Button("Save") {
                        let item = ExpenseItem(name: name, type: type, amount: amount)
                        expenses.items.append(item)
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
