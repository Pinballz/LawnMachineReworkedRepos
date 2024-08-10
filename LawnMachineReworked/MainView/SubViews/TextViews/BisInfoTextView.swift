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
    
    @Query var customers: [NewCustomer]
    
    @Bindable var myCustomers: NewCustomer
    
    var body: some View {
        // This is how I created total sub income
        let sum = customers.map({$0.subscription}).reduce(0,+)
        
        CustomSectionView(headerTitle: "Your total accounts") {
            HStack {
                Spacer()
                Text("\(customers.count)")
                    .foregroundStyle(.black)
                Spacer()
            }
        }
        CustomSectionView(headerTitle: "Your total subsctiption income") {
            HStack {
                Spacer()
                Text("\(Int(sum))")
                    .foregroundStyle(.black)
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
        return  BisInfoTextView(myCustomers: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
