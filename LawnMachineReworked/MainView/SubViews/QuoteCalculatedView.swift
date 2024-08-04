//
//  QuoteCalculatedView.swift
//  LawnMachineReworked
//
//  Created by Joshua Hauer on 7/29/24.
//

import SwiftUI
import SwiftData

struct QuoteCalculatedView: View {
    
    @Environment(\.modelContext) private var context
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var myQuote: PropertyInfo
    
    @Binding var businessInfo: BusinessInfo
    
    @ObservedObject var customers: CustomerViewModel
    
    @Query private var dataStorage: [DataStorage]
    
    var body: some View {
        

        
        NavigationStack {
            VStack {
                Form {
                    QuoteCalcTextView(myQuote: $myQuote, businessInfo: $businessInfo, customers: CustomerViewModel())
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
        //Array of customer info appended
        let newCustomers = NewCustomer(
            name: myQuote.newName,
            subscription: myQuote.newSub, address: myQuote.newAddress,
            dateSubmitted: myQuote.newDate, sqrft: myQuote.sqrft, hedgeTotal: myQuote.hedgeTotal,priceChosen: myQuote.priceChosen)
        
        customers.getCustomers(newCustomer:newCustomers)
        
        let subIncome = [newCustomers.subscription]
        let subAdd = subIncome.reduce(0,+) + businessInfo.subIncome
        
        businessInfo.subIncome = subAdd
        
        let savedCustomer = DataStorage(name: myQuote.newName, subscription: myQuote.newSub, address: myQuote.newAddress, dateSubmitted: myQuote.newDate, sqrft: myQuote.sqrft, hedgeTotal: myQuote.hedgeTotal, priceChosen: myQuote.priceChosen, subIncome: subAdd)
        
        print(customers.customers)
        
        context.insert(savedCustomer)
    }
    func completeCalculation() {
        myQuote.newName = ""
        myQuote.newSub = 0
        myQuote.newAddress = ""
        myQuote.newDate = Date.now
        myQuote.sqrft = nil
        myQuote.hedgeTotal = nil
        myQuote.priceChosen = 0.0
    }
}

#Preview {
    QuoteCalculatedView(myQuote: Binding.constant(PropertyInfo()), businessInfo: Binding.constant(BusinessInfo()), customers: CustomerViewModel())
}
