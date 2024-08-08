//
//  CustomerView.swift
//  LawnMachineReworked
//
//  Created by Joshua Hauer on 7/29/24.
//

import SwiftUI
import SwiftData

struct CustomerView: View {
    
    @Environment(\.modelContext) var context
    
    @Binding var businessInfo: BusinessInfo
    
    @Query var customers: [NewCustomer]
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    if customers.isEmpty {
                        Form {
                            HStack{
                                Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                                Text("Lets get some customers!").foregroundStyle(.black)
                            }
                        }.foregroundColor(LMColor.logoColor)
                    } else {
                        Form {
                            HStack {
                                Text("My Customers")
                            }
                            ForEach(customers) { customer in
                                NavigationLink(destination: CustomerDetailView(businessInfo: $businessInfo, customers: customer)) {
                                    HStack {
                                        Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                                        Text(customer.name).foregroundStyle(.black)
                                    }
                                }
                            }
                            .onDelete(perform: deleteCustomers)
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
                .foregroundColor(LMColor.logoColor)
                .scrollContentBackground(.hidden)
                .background(LMColor.backgroundColor)
            }
        }
    }
    
    func deleteCustomers(_ indexSet: IndexSet) {
        for index in indexSet {
            let customer = customers[index]
            context.delete(customer)
        }
    }
}

#Preview {
    CustomerView(businessInfo: Binding.constant(BusinessInfo()))
}
