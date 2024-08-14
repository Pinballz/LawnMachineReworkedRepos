//
//  QuoteGenTextView.swift
//  LawnMachineReworked
//
//  Created by Joshua Hauer on 8/3/24.
//

import SwiftUI

struct QuoteGenTextView: View {
    
    @Binding var myQuote: PropertyInfo
    @State private var pricePerSqrft: [Double] = [0.01, 0.02, 0.03,0.04, 0.05, 0.06]
    @State private var showCustomQuote: Bool = true
    @State private var customQuoteButton: Bool = false
    @FocusState.Binding var keyboardIsFocused: Bool
    
    var body: some View {
        
        Section {
            Button {
                showCustomQuote.toggle()
                customQuoteButton.toggle()
            } label: {
                HStack() {
                    Spacer()
                    Image(systemName:"gear")
                        .foregroundStyle(LMColor.logoColor)
                    Text("\(customQuoteButton ? "Detail Quote" : "Custom Quote")")
                        .foregroundColor(.black)
                    Image(systemName:"gear")
                        .foregroundStyle(LMColor.logoColor)
                    Spacer()
                }
            }
        }
        
        CustomSectionView(headerTitle: "Customer Name") {
            HStack {
                Spacer()
                TextField("Name",text: $myQuote.newName)
                    .foregroundColor(.black)
                    .keyboardType(.default)
                    .multilineTextAlignment(.center)
                    .focused($keyboardIsFocused)
                Spacer()
            }
        }
        CustomSectionView(headerTitle: "Address") {
            HStack {
                Spacer()
                TextField("Address",text: $myQuote.newAddress)
                    .foregroundColor(.black)
                    .keyboardType(.default)
                    .multilineTextAlignment(.center)
                    .focused($keyboardIsFocused)
                Spacer()
            }
        }
        if showCustomQuote {
            CustomSectionView(headerTitle: "Custom Quote") {
                HStack {
                    Spacer()
                    TextField("Quote Total",value: $myQuote.newSub, format: .currency(code: "USD"))
                        .foregroundColor(.black)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.center)
                        .focused($keyboardIsFocused)
                    Spacer()
                }
            }
        } else {
            CustomSectionView(headerTitle: "Square foot of home") {
                HStack {
                    Spacer()
                    TextField("SQRFT",value: $myQuote.sqrft, format: .number)
                        .foregroundColor(.black)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.center)
                        .focused($keyboardIsFocused)
                    Spacer()
                }
            }
            CustomSectionView(headerTitle: "Amount of Hedges") {
                HStack {
                    Spacer()
                    TextField("Hedge Total",value: $myQuote.hedgeTotal, format: .number)
                        .foregroundColor(.black)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.center)
                        .focused($keyboardIsFocused)
                    Spacer()
                }
            }
            CustomSectionView(headerTitle: "Price Per Square Foot") {
                Picker("per sqrft price", selection: $myQuote.priceChosen) {
                    ForEach(pricePerSqrft, id: \.self) {
                        Text("$\($0.removeZerosFromEnd())")
                    }
                }.pickerStyle(.segmented)
            }
        }
        CustomSectionView(headerTitle: "Date of your quote") {
            DatePicker(selection: $myQuote.newDate,displayedComponents: .date) {
                Text("Quote Date")
            }
            .foregroundColor(.black)
        }
        CustomSectionView(headerTitle: "Notes") {
            HStack {
                Spacer()
                TextEditor(text: $myQuote.notes)
                    .foregroundColor(.black)
                    .frame(height: 150)
                    .keyboardType(.default)
                    .cornerRadius(10)
                    .focused($keyboardIsFocused)
                Spacer()
            }
        }
    }
}
