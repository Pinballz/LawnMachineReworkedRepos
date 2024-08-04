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
    
    @ObservedObject var customers: CustomerViewModel
    
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
    }
}

#Preview {
    QuoteCalcTextView(myQuote: Binding.constant(PropertyInfo()), businessInfo: Binding.constant(BusinessInfo()), customers: CustomerViewModel())
}
