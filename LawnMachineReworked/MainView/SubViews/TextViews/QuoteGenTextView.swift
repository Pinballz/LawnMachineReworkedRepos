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
    @State private var showCustomQuote: Bool = false
    @State private var customQuoteButton: Bool = false
    @State private var opacity = 1.0
    
    var body: some View {
        
        Section {
            Button {
                showCustomQuote.toggle()
                customQuoteButton.toggle()
            } label: {
                HStack() {
                    Spacer()
                    Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                    Text("\(customQuoteButton ? "Custom Quote" : "Detail Quote")").foregroundColor(.black)
                    Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                    Spacer()
                }
            }
        } header: {
            HStack{
                Spacer()
                Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                Text("Select Type").foregroundStyle(.black)
                Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                Spacer()
            }
        }
        Section{
            HStack {
                Spacer()
                TextField("Enter",text: $myQuote.newName).foregroundColor(.black).keyboardType(.default)
                    .multilineTextAlignment(.center)
                Spacer()
            }
        }header: {
            HStack{
                Spacer()
                Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                Text("Guest Name").foregroundStyle(.black)
                Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                Spacer()
            }
        }
        Section{
            HStack {
                Spacer()
                TextField("Enter",text: $myQuote.newAddress).foregroundColor(.black).keyboardType(.default)
                    .multilineTextAlignment(.center)
                Spacer()
            }
        }header: {
            HStack {
                Spacer()
                Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                Text("Address").foregroundStyle(.black)
                Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                Spacer()
            }
        }
        if showCustomQuote {
            Section {
                HStack {
                    Spacer()
                    TextField("Custom Quote",value: $myQuote.newSub, format: .number).foregroundColor(.black).keyboardType(.numberPad)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
            }header: {
                HStack {
                    Spacer()
                    Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                    Text("Custom Quote").foregroundStyle(.black)
                    Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                    Spacer()
                }
            }
            
        } else {
            Section{
                HStack {
                    Spacer()
                    TextField("SQRFT",value: $myQuote.sqrft, format: .number).foregroundColor(.black).keyboardType(.numberPad)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
            }header: {
                HStack {
                    Spacer()
                    Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                    Text("square foot of home").foregroundStyle(.black)
                    Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                    Spacer()
                }
            }
            Section{
                HStack {
                    HStack {
                        Spacer()
                        TextField("Hedge Total",value: $myQuote.hedgeTotal, format: .number).foregroundColor(.black).keyboardType(.numberPad)
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                }
            }header: {
                HStack {
                    Spacer()
                    Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                    Text("Amount of Hedges").foregroundStyle(.black)
                    Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                    Spacer()
                }
            }
            Section {
                Picker("per sqrft price", selection: $myQuote.priceChosen) {
                    ForEach(pricePerSqrft, id: \.self) {
                        Text("\($0.removeZerosFromEnd())")
                    }
                }.pickerStyle(.segmented)
            }header: {
                HStack {
                    Spacer()
                    Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                    Text("Price Per Square Foot").foregroundStyle(.black)
                    Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                    Spacer()
                }
            }
        }
        Section{
            HStack {
                Spacer()
                TextField("Enter",text: $myQuote.notes, axis: .vertical).foregroundColor(.black).keyboardType(.default)
                    .multilineTextAlignment(.center)
                Spacer()
            }
        }header: {
            HStack {
                Spacer()
                Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                Text("Notes").foregroundStyle(.black)
                Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                Spacer()
            }
        }
        Section {
            DatePicker(selection: $myQuote.newDate,displayedComponents: .date) {
                Text("Quote Date")
            }.foregroundColor(.black)
        }header: {
            HStack {
                Spacer()
                Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                Text("Date of your quote").foregroundStyle(.black)
                Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                Spacer()
            }
        }
    }
}

#Preview {
    QuoteGenTextView(myQuote: Binding.constant(PropertyInfo()), businessInfo: Binding.constant(BusinessInfo()))
}
