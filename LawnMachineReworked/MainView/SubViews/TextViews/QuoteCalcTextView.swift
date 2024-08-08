//
//  QuoteCalcTextView.swift
//  LawnMachineReworked
//
//  Created by Joshua Hauer on 8/3/24.
//

import SwiftUI

struct QuoteCalcTextView: View {
    
    @Binding var myQuote: PropertyInfo
    
    @Binding var businessInfo: BusinessInfo
    
    var body: some View {
        
        var totalYardCost: Double {
            Double(myQuote.sqrft ?? 0) * myQuote.priceChosen
        }
        var totalHedgeCost: Int {
            Int(myQuote.hedgeTotal ?? 0) * 3
        }
        var total: Double {
            Double(totalHedgeCost) + totalYardCost
        }
        
        
        if myQuote.hedgeTotal != nil && myQuote.sqrft != nil {
            Section{
                HStack {
                    Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                    Text("\(myQuote.newName)").foregroundColor(.black)
                }
            }header: {
                Text("Customer Name")
            }
            Section{
                HStack {
                    Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                    Text("\(myQuote.newAddress)").foregroundColor(.black)
                }
            }header: {
                Text("Address")
            }
            Section{
                HStack {
                    Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                    Text(" \(Int(total))").foregroundColor(.black)
                }
            }header: {
                Text("Total")
            }
            Section{
                HStack {
                    Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                    Text("Regular Cut cost: \(Int(totalYardCost))").foregroundColor(.black)
                }
                HStack {
                    Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                    Text("Cost of \(myQuote.hedgeTotal ?? 0) hedges: \(totalHedgeCost)").foregroundColor(.black)
                }
            }header: {
                Text("Quote Breakdown")
            }
            Section{
                HStack {
                    Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                    Text("\(myQuote.notes)").foregroundColor(.black)
                }
            }header: {
                Text("Notes for this house")
            }
        } else {
            Section{
                HStack {
                    Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                    Text("\(myQuote.newName)").foregroundColor(.black)
                }
            }header: {
                Text("Customer Name")
            }
            Section{
                HStack {
                    Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                    Text("\(myQuote.newAddress)").foregroundColor(.black)
                }
            }header: {
                Text("Address")
            }
            Section{
                HStack {
                    Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                    Text("\(myQuote.newSub ?? 0)").foregroundColor(.black)
                }
            }header: {
                Text("Total")
            }
            Section{
                HStack {
                    Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                    Text("\(myQuote.notes)").foregroundColor(.black)
                }
            }header: {
                Text("Notes")
            }
        }
    }
}

#Preview {
    QuoteCalcTextView(myQuote: Binding.constant(PropertyInfo()), businessInfo: Binding.constant(BusinessInfo()))
}
