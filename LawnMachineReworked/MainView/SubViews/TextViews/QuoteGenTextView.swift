//
//  QuoteGenTextView.swift
//  LawnMachineReworked
//
//  Created by Joshua Hauer on 8/3/24.
//

import SwiftUI

struct QuoteGenTextView: View {
    
    @Binding var myQuote: PropertyInfo
    @Binding var businessInfo: BusinessInfo
    @State private var pricePerSqrft: [Double] = [0.01, 0.02, 0.03,0.04, 0.05, 0.06]
    @ObservedObject var customers: CustomerViewModel
    
    var body: some View {
        Section{
            TextField("Enter",text: $myQuote.newName).foregroundColor(.black).keyboardType(.default)
        }header: {
            Text("Guest Name")
        }
        Section{
            TextField("Enter",text: $myQuote.newAddress).foregroundColor(.black).keyboardType(.default)
        }header: {
            Text("Address")
        }
        Section{
            TextField("SQRFT",value: $myQuote.sqrft, format: .number).foregroundColor(.black).keyboardType(.numberPad)
        }header: {
            Text("square foot of home")
        }
        Section{
            TextField("Hedge Total",value: $myQuote.hedgeTotal, format: .number).foregroundColor(.black).keyboardType(.numberPad)
        }header: {
            Text("Amount of Hedges")
        }
        Section {
            DatePicker(selection: $myQuote.newDate,displayedComponents: .date) {
                Text("Quote Date")
            }.foregroundColor(.black)
        }header: {
            Text("Date of your quote")
        }
        Section {
            Picker("per sqrft price", selection: $myQuote.priceChosen) {
                ForEach(pricePerSqrft, id: \.self) {
                    Text("\($0.removeZerosFromEnd())")
                }
            }.pickerStyle(.segmented)
        }header: {
            Text("Price Per Square Foot")
        }
    }
}

#Preview {
    QuoteGenTextView(myQuote: Binding.constant(PropertyInfo()), businessInfo: Binding.constant(BusinessInfo()), customers: CustomerViewModel())
}
