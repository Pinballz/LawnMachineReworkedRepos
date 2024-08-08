//
//  QuoteCalculatedView.swift
//  LawnMachineReworked
//
//  Created by Joshua Hauer on 7/29/24.
//

import SwiftUI
import SwiftData

struct QuoteCalculatedView: View {
    
    @Environment(\.modelContext) var context
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var myQuote: PropertyInfo
    
    @Binding var businessInfo: BusinessInfo
    
    @Query var customers: [NewCustomer]
    
    var body: some View {

        NavigationStack {
            VStack {
                Form {
                    QuoteCalcTextView(myQuote: $myQuote, businessInfo: $businessInfo)
                    Button("Add This Property") {
                        addNewCustomer()
                        completeCalculation()
                        dismiss()
                    }.foregroundColor(LMColor.logoColor)
                    Button("Clear Results") {
                        completeCalculation()
                        dismiss()
                    }.foregroundColor(.red)
                }
                .scrollContentBackground(.hidden)
                .foregroundColor(LMColor.logoColor)
                .background(LMColor.backgroundColor)
            }
        }
    }
    func addNewCustomer() {
        
        let newCustomers = NewCustomer(
            name: myQuote.newName,
            subscription: myQuote.newSub!, address: myQuote.newAddress,
            dateSubmitted: myQuote.newDate, sqrft: myQuote.sqrft, hedgeTotal: myQuote.hedgeTotal,priceChosen: myQuote.priceChosen, notes: myQuote.notes)

        context.insert(newCustomers)
    }
    func completeCalculation() {
        myQuote.newName = ""
        myQuote.newSub = nil
        myQuote.newAddress = ""
        myQuote.newDate = Date.now
        myQuote.sqrft = nil
        myQuote.hedgeTotal = nil
        myQuote.priceChosen = 0.0
    }
}

#Preview {
    QuoteCalculatedView(myQuote: Binding.constant(PropertyInfo()), businessInfo: Binding.constant(BusinessInfo()))
}
