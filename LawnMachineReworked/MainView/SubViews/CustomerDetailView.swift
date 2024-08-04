//
//  CustomerDetailView.swift
//  LawnMachineReworked
//
//  Created by Joshua Hauer on 7/29/24.
//

import SwiftUI
import SwiftData

struct CustomerDetailView: View {
    
    @Binding var businessInfo: BusinessInfo
    
    @StateObject var customers: CustomerViewModel
    
    let customerInfo: NewCustomer 
    
    @Query private let dataStorage: [DataStorage]
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                VStack {
                    Form {
                                Section {
                                    HStack {
                                        Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                                        Text(customerInfo.address).foregroundStyle(.black)
                                    }
                                } header:  {
                                    Text("Address")
                                }
                                Section {
                                    HStack {
                                        Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                                        Text(customerInfo.subscription , format: .currency(code: "USD")).foregroundStyle(.black)
                                    }
                                } header: {
                                    Text("Monthly Subscription")
                                }
                                Section {
                                    HStack {
                                        Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                                        Text(customerInfo.dateSubmitted, format: .dateTime.month(.wide).day().year()).foregroundStyle(.black)
                                    }
                                } header: {
                                    Text("Loyal Since")
                                }
                    }
                    .toolbar {
                        ToolbarItem(placement:.topBarLeading) {
                            Text("Lawn Machine")
                                .font(.system(size: 32,weight: .bold))
                                .foregroundStyle(LMColor.logoColor)
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .foregroundColor(LMColor.logoColor)
                    .background(LMColor.backgroundColor)
                }
            }
        }
    }
}

#Preview {
    CustomerDetailView(businessInfo: Binding.constant(BusinessInfo()), customers: CustomerViewModel(), customerInfo: CustomerViewModel().customers.first!)
}
