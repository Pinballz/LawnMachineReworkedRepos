//
//  CustomerView.swift
//  LawnMachineReworked
//
//  Created by Joshua Hauer on 7/29/24.
//

import SwiftUI
import SwiftData

struct CustomerView: View {
    
    @Environment(\.modelContext) private var context
    
    @Binding var businessInfo: BusinessInfo
    
    @ObservedObject var customers: CustomerViewModel
    
    @Query private var dataStorage: [DataStorage]
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    if customers.customers.isEmpty {
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
                            ForEach(customers.customers) { customer in
                                NavigationLink(destination: CustomerDetailView(businessInfo: $businessInfo, customers: customers, customerInfo: customer )){
                                    HStack {
                                        Image(systemName:"gear").foregroundStyle(LMColor.logoColor)
                                        Text(customer.name).foregroundStyle(.black)
                                    }
                                }
                            }.onDelete { indexes in
                                for index in indexes {
                                    deleteSavedData(dataStorage[index])
                                    delete(at: indexes)
                                }
                                
                            }
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
    func delete(at offsets: IndexSet) {
        for i in offsets.makeIterator() {
            let sub = customers.customers[i]
            businessInfo.subIncome -= sub.subscription
        }
        customers.removeCustomers(offsets: offsets)
    }
    func deleteSavedData(_ customerSaved: DataStorage) {
        
    }
}

#Preview {
    CustomerView(businessInfo: Binding.constant(BusinessInfo()), customers: CustomerViewModel())
}
