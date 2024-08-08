//
//  LMTextView.swift
//  LawnMachineReworked
//
//  Created by Joshua Hauer on 8/3/24.
//

import SwiftUI
import SwiftData

struct BisInfoTextView: View {
    
    @Environment(\.modelContext) private var context
    
    @Binding var businessInfo: BusinessInfo
    
    @Query var customers: [NewCustomer]
    
    @Bindable var myCustomers: NewCustomer
    
    var body: some View {
        // This is how I created total sub income
        let sum = customers.map({$0.subscription}).reduce(0,+)
        
        Section{
            HStack {
                Spacer()
                Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                Text("\(customers.count)").foregroundStyle(.black)
                Spacer()
            }
        }header: {
            HStack {
                Spacer()
                Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                Text("Your total accounts").foregroundStyle(.black)
                Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                Spacer()
            }
        }
        Section{
            HStack {
                Spacer()
                Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                Text("\(Int(sum))").foregroundStyle(.black)
                Spacer()
            }
        }header: {
            HStack {
                Spacer()
                Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                Text("Your total Subscription income").foregroundStyle(.black)
                Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                Spacer()
            }
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: NewCustomer.self, configurations: config)
        let example = NewCustomer(name: "", subscription: Int(), address: "", dateSubmitted: Date(), sqrft: Int(), hedgeTotal: Int(), priceChosen: Double(), notes: "")
        return  BisInfoTextView(businessInfo: Binding.constant(BusinessInfo()), myCustomers: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
