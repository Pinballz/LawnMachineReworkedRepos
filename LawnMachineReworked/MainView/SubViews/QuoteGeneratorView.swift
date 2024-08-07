//
//  QuoteGeneratorView.swift
//  LawnMachineReworked
//
//  Created by Joshua Hauer on 7/29/24.
//

import SwiftUI
import SwiftData

struct QuoteGeneratorView: View {
    
    @Environment(\.modelContext) var context
    
    @Binding var myQuote: PropertyInfo
    @Binding var businessInfo: BusinessInfo
    
    @State private var showingQuoteCalculatedView = false
    
    @Query var customers: [NewCustomer]
    
    var body: some View {
        NavigationStack{
            ZStack {
                VStack {
                    Form {
                        QuoteGenTextView(myQuote: $myQuote, businessInfo: $businessInfo)
                        Button("Calculate") {
                            showingQuoteCalculatedView.toggle()
                            quoteCalculator(sqrft: myQuote.sqrft ?? 0 )
                        }
                        .sheet(isPresented: $showingQuoteCalculatedView) {
                            QuoteCalculatedView(myQuote: $myQuote, businessInfo: $businessInfo)
                        }
                        Button("Clear Estimate") {
                            clearEstimate()
                        }.foregroundStyle(.red)
                    }
                    .toolbar {
                        ToolbarItem(placement:.topBarLeading) {
                            Text("Lawn Machine")
                                .font(.system(size: 32,weight: .bold))
                                .foregroundStyle(LMColor.logoColor)
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .foregroundColor(LMColor.logoColor)
                .background(LMColor.backgroundColor)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    func quoteCalculator(sqrft: Int) {
        
        let pricePerSqrft = myQuote.priceChosen
        var calcSqft: Double {
            pricePerSqrft * Double(sqrft)
        }
        var calcHedge: Int {
            (myQuote.hedgeTotal ?? 0) * 3
        }
        let total = calcSqft + Double(calcHedge)
        myQuote.newSub = Int(total)
    }
    func clearEstimate() {
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
    QuoteGeneratorView(myQuote: .constant(PropertyInfo()), businessInfo: .constant(BusinessInfo()))
}
