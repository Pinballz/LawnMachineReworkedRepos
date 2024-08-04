//
//  LMTextView.swift
//  LawnMachineReworked
//
//  Created by Joshua Hauer on 8/3/24.
//

import SwiftUI

struct BisInfoTextView: View {
    
    @Binding var businessInfo: BusinessInfo
    
    @StateObject var customers: CustomerViewModel
    
    var body: some View {
    
        
            Section{
                Text("\(customers.customers.count)").foregroundStyle(.black)
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
    BisInfoTextView(businessInfo: Binding.constant(BusinessInfo()), customers: CustomerViewModel())
}
