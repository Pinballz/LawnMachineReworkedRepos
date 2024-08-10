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
    
    @State private var showingQuoteCalculatedView = false
    
    @Query var customers: [NewCustomer]
    
    var body: some View {
        NavigationStack{
            ZStack {
                VStack {
                    Form {
                        QuoteGenTextView(myQuote: $myQuote)
                        Button("Calculate") {
                            if myQuote.newSub == nil {
                                showingQuoteCalculatedView.toggle()
                                quoteCalculator(sqrft: myQuote.sqrft ?? 0 )
                            } else {
                                showingQuoteCalculatedView.toggle()
                            }
                        }
                        .sheet(isPresented: $showingQuoteCalculatedView) {
                            QuoteCalculatedView(myQuote: $myQuote)
                        }
                        Button("Clear Estimate") {
                            clearEstimate()
                        }.foregroundStyle(.red)
                    }
                    .toolbar {
                        ToolbarItem(placement:.topBarLeading) {
                            VStack{
                                Spacer()
                                HStack {
                                    Text("Lawn Machine")
                                        .font(.system(size: 32,weight: .bold))
                                        .foregroundStyle(LMColor.logoColor)
                                    Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                                        .font(.title.bold())
                                }
                                HStack {
                                    Text("Create Your Quote")
                                        .font(.system(size: 15,weight: .regular))
                                        .foregroundStyle(LMColor.logoColor)
                                    Spacer()
                                }
                                Spacer()
                                Spacer()
                            }
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
        myQuote.notes = ""
    }
}

#Preview {
    QuoteGeneratorView(myQuote: .constant(PropertyInfo()))
}
