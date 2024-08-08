//
//  CustomerDetailView.swift
//  LawnMachineReworked
//
//  Created by Joshua Hauer on 7/29/24.
//

import SwiftUI
import SwiftData

struct CustomerDetailView: View {
    
    @Environment(\.modelContext) var context
    
    @Binding var businessInfo: BusinessInfo
    
    @Query var myCustomers: [NewCustomer]
    
    @Binding var myQuote: PropertyInfo
    
    @Bindable var customers: NewCustomer
    
    // added notes, causing errors, still troubleshooting.
    
    var body: some View {

        NavigationStack() {
            ZStack {
                VStack {
                    Form {
                        Section {
                            HStack {
                                Spacer()
                                
                                Text(customers.address).foregroundStyle(.black)
                                Spacer()
                            }
                        } header:  {
                            HStack {
                                Spacer()
                                Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                                Text("Address").foregroundStyle(.black)
                                Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                                Spacer()
                            }
                        }
                        Section {
                            HStack {
                                Spacer()
                                
                                Text(customers.subscription , format: .currency(code: "USD")).foregroundStyle(.black)
                                Spacer()
                            }
                        } header: {
                            HStack {
                                Spacer()
                                Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                                Text("Monthly Subscription").foregroundStyle(.black)
                                Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                                Spacer()
                            }
                        }
                        Section {
                            HStack {
                                Spacer()
                                
                                Text(customers.dateSubmitted, format: .dateTime.month(.wide).day().year()).foregroundStyle(.black)
                                Spacer()
                            }
                        } header: {
                            HStack {
                                Spacer()
                                Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                                Text("Loyal Since").foregroundStyle(.black)
                                Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                                Spacer()
                            }
                        }
                        Section{
                            HStack {
                                Spacer()
                                TextField("Enter",text: $customers.notes).foregroundColor(.black).keyboardType(.default)
                                        .multilineTextAlignment(.center)
                                    Spacer()
                            }
                        }header: {
                            HStack {
                                Spacer()
                                Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                                Text("Edit Your Note").foregroundStyle(.black)
                                Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                                Spacer()
                            }
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
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: NewCustomer.self, configurations: config)
        let example = NewCustomer(name: "", subscription: Int(), address: "", dateSubmitted: Date(), sqrft: Int(), hedgeTotal: Int(), priceChosen: Double(), notes: "")
        return CustomerDetailView(businessInfo: Binding.constant(BusinessInfo()), myQuote: Binding.constant(PropertyInfo()), customers: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
