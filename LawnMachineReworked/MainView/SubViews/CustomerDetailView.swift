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
    
    @Bindable var customers: NewCustomer
    
    var body: some View {

        NavigationStack {
            ZStack {
                VStack {
                    Form {
                                Section {
                                    HStack {
                                        Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                                        Text(customers.address).foregroundStyle(.black)
                                    }
                                } header:  {
                                    Text("Address")
                                }
                                Section {
                                    HStack {
                                        Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                                        Text(customers.subscription , format: .currency(code: "USD")).foregroundStyle(.black)
                                    }
                                } header: {
                                    Text("Monthly Subscription")
                                }
                                Section {
                                    HStack {
                                        Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                                        Text(customers.dateSubmitted, format: .dateTime.month(.wide).day().year()).foregroundStyle(.black)
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
    
    func subscriptionTotal() {
        let customerSub = customers.subscription
        var totalSubs = [businessInfo.subIncome]
        
        totalSubs.append(customerSub)
        businessInfo.subIncome = totalSubs.reduce(0,+)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: NewCustomer.self, configurations: config)
        let example = NewCustomer(name: "", subscription: Int(), address: "", dateSubmitted: Date(), sqrft: Int(), hedgeTotal: Int(), priceChosen: Double(), totalSubIncome: Int())
       return CustomerDetailView(businessInfo: Binding.constant(BusinessInfo()), customers: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
