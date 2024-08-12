//
//  QuoteCalcTextView.swift
//  LawnMachineReworked
//
//  Created by Joshua Hauer on 8/3/24.
//

import SwiftUI

struct QuoteCalcTextView: View {
    
    @Binding var myQuote: PropertyInfo
    
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
            CustomSectionView(headerTitle: "Customer Name") {
                HStack {
                    Text("\(myQuote.newName)")
                        .foregroundColor(.black)
                }
            }
            CustomSectionView(headerTitle:"Address") {
                HStack {
                    Text("\(myQuote.newAddress)")
                        .foregroundColor(.black)
                }
            }
            CustomSectionView(headerTitle: "Quote Breakdown") {
                VStack {
                    HStack {
                        Text("Regular Cut cost: ")
                            .foregroundStyle(LMColor.logoColor)
                        Text("$\(Int(totalYardCost))")
                            .foregroundColor(.black)
                    }
                    HStack {
                        Text("Cost of \(myQuote.hedgeTotal ?? 0) hedges: ")
                            .foregroundStyle(LMColor.logoColor)
                        Text("$\(totalHedgeCost)")
                            .foregroundColor(.black)
                    }
                }
            }
            CustomSectionView(headerTitle: "Total") {
                HStack {
                    Text("$\(Int(total))")
                        .foregroundColor(.black)
                }
            }
            
            CustomSectionView(headerTitle: "Notes for this house") {
                HStack {
                    Text("\(myQuote.notes)")
                        .foregroundColor(.black)
                }
            }
        } else {
            CustomSectionView(headerTitle: "Customer Name") {
                HStack {
                    Text("\(myQuote.newName)")
                        .foregroundColor(.black)
                }
            }
            CustomSectionView(headerTitle: "Address") {
                HStack {
                    Text("\(myQuote.newAddress)")
                        .foregroundColor(.black)
                }
            }
            CustomSectionView(headerTitle: "Total") {
                HStack {
                    Text("$\(myQuote.newSub ?? 0)")
                        .foregroundColor(.black)
                }
            }
            CustomSectionView(headerTitle: "Notes") {
                HStack {
                    Text("\(myQuote.notes)")
                        .foregroundColor(.black)
                }
            }
        }
    }
}
#Preview {
    QuoteCalcTextView(myQuote: Binding.constant(PropertyInfo()))
}
