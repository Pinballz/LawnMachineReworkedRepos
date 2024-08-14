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
    // creating a variable that removes the keyboard from view
    @FocusState private var keyboardIsFocused: Bool
    
    var body: some View {
        NavigationStack{
            ZStack {
                LMColor.backgroundColor
                    .ignoresSafeArea()
                VStack {
                    Form {
                            QuoteGenTextView(myQuote: $myQuote,keyboardIsFocused: $keyboardIsFocused)
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
                        }
                        .foregroundStyle(.red)
                    }
                    .scrollContentBackground(.hidden)
                    .toolbar {
                        ToolbarItem(placement:.topBarLeading) {
                            VStack{
                                Spacer()
                                HStack {
                                    Text("Lawn Machine")
                                        .font(.system(size: 32,weight: .bold))
                                        .foregroundStyle(LMColor.logoColor)
                                    Image(systemName:"gear")
                                        .foregroundStyle(LMColor.logoColor)
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
                                Spacer()
                            }
                        }
                    }
                }
                .foregroundColor(LMColor.logoColor)
            }
            .onTapGesture {
                keyboardIsFocused = false
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func quoteCalculator(sqrft: Int) {
        
        let pricePerSqrft = myQuote.priceChosen
        _ = myQuote.hedgeTotal
        let calcSqft = pricePerSqrft * Double(sqrft)
        let calcHedge = (myQuote.hedgeTotal ?? 0) * 3
        let total = calcSqft + Double(calcHedge)
        
        myQuote.newSub = Int(total)
    }
    func clearEstimate() {
        myQuote.newName = ""
        myQuote.newSub = nil
        myQuote.newAddress = ""
        myQuote.newDate = Date.now
        myQuote.sqrft = nil
        myQuote.hedgeTotal = nil
        myQuote.priceChosen = 0.0
        myQuote.notes = ""
    }
}

