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
    
    @Binding var myQuote: PropertyInfo
    
    @Query var customers: [NewCustomer]
    
    @State private var path = [NewCustomer]()
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    if customers.isEmpty {
                        Form {
                            HStack{
                                Image(systemName:"gear")
                                    .foregroundStyle(LMColor.logoColor)
                                Text("Lets get some customers!")
                                    .foregroundStyle(.black)
                            }
                        }.foregroundColor(LMColor.logoColor)
                    } else {
                        Form {
                            Section {
                                ForEach(customers) { customer in
                                    NavigationLink(destination: CustomerDetailView(myQuote: $myQuote, customers: customer)) {
                                        HStack {
                                            Image(systemName:"gear")
                                                .foregroundStyle(LMColor.logoColor)
                                            Text(customer.name)
                                                .foregroundStyle(.black)
                                        }
                                    }
                                }
                                .onDelete(perform: deleteCustomers)
                            } header: {
                                Text("Customers")
                                    .foregroundColor(LMColor.logoColor)
                            }
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement:.topBarLeading) {
                        VStack{
                            HStack {
                                Text("Lawn Machine")
                                    .font(.system(size: 32,weight: .bold))
                                    .foregroundStyle(LMColor.logoColor)
                                Image(systemName:"gear")
                                    .foregroundStyle(LMColor.logoColor).font(.title.bold())
                            }
                        }
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
    CustomerView(myQuote: Binding.constant(PropertyInfo()))
}
