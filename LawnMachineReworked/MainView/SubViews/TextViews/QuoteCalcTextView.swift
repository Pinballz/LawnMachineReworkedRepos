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
                Text("Your total cost is \(Int(total))").foregroundColor(.black)
            }header: {
                Text("Total")
            }
            Section{
                Text("Regular Cut cost: \(Int(totalYardCost))").foregroundColor(.black)
                Text("Cost of \(myQuote.hedgeTotal ?? 0) hedges: \(totalHedgeCost)").foregroundColor(.black)
            }header: {
                Text("Quote Breakdown")
            }
        } else {
            Section{
                Text("Your subscription total is: \(myQuote.newSub ?? 0)").foregroundColor(.black)
            }header: {
                Text("Total")
            }
        }
    }
}

#Preview {
    QuoteCalcTextView(myQuote: Binding.constant(PropertyInfo()), businessInfo: Binding.constant(BusinessInfo()))
}
