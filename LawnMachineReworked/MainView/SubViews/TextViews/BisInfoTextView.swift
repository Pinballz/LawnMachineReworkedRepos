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
    
    var body: some View {
        
            Section{
                Text("\(customers.count)").foregroundStyle(.black)
            }header: {
                Text("Your total accounts")
            }
            Section{
                Text("\(Int(businessInfo.subIncome))").foregroundStyle(.black)
            }header: {
                Text("Your total Subscription income")
            }
    }
}

#Preview {
    BisInfoTextView(businessInfo: Binding.constant(BusinessInfo()))
}
