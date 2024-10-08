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
    
    @Query var myCustomers: [NewCustomer]
    
    @Binding var myQuote: PropertyInfo
    
    @Bindable var customers: NewCustomer
    
    @FocusState private var anotherViewKeyboardIsFocused: Bool
    
    var body: some View {
        NavigationStack() {
            ZStack {
                VStack {
                    Form {
                        Section {
                            HStack {
                                Spacer()
                                Text(customers.address)
                                    .foregroundStyle(.black)
                                Spacer()
                            }
                        } header:  {
                            HStack {
                                Image(systemName:"gear")
                                    .foregroundStyle(LMColor.logoColor)
                                Text("Address")
                                    .foregroundStyle(.black)
                            }
                        }
                        Section {
                            HStack {
                                Spacer()
                                Text(customers.subscription , format: .currency(code: "USD"))
                                    .foregroundStyle(.black)
                                Spacer()
                            }
                        } header: {
                            HStack {
                                Image(systemName:"gear")
                                    .foregroundStyle(LMColor.logoColor)
                                Text("Monthly Subscription")
                                    .foregroundStyle(.black)
                            }
                        }
                        Section {
                            HStack {
                                Spacer()
                                Text(customers.dateSubmitted, format: .dateTime.month(.wide).day().year())
                                    .foregroundStyle(.black)
                                Spacer()
                            }
                        } header: {
                            HStack {
                                Image(systemName:"gear")
                                    .foregroundStyle(LMColor.logoColor)
                                Text("Loyal Since")
                                    .foregroundStyle(.black)
                            }
                        }
                        Section{
                            HStack {
                                Spacer()
                                TextEditor(text: $customers.notes)
                                    .foregroundColor(.black)
                                    .frame(height: 150)
                                    .cornerRadius(8)
                                    .keyboardType(.default)
                                    .focused($anotherViewKeyboardIsFocused)
                                Spacer()
                            }
                        }header: {
                            HStack {
                                Image(systemName:"gear")
                                    .foregroundStyle(LMColor.logoColor)
                                Text("Edit Your Note")
                                    .foregroundStyle(.black)
                            }
                        }
                    }
                    .toolbar {
                        ToolbarItem(placement:.topBarLeading) {
                            VStack {
                                Spacer()
                                HStack {
                                    Text("Lawn Machine")
                                        .font(.system(size: 28,weight: .bold))
                                        .foregroundStyle(LMColor.logoColor)
                                    Image(systemName:"gear")
                                        .foregroundStyle(LMColor.logoColor)
                                        .font(.subheadline.bold())
                                }
                                Text("\(customers.name)'s Information")
                                    .foregroundStyle(LMColor.logoColor)
                                    .font(.system(size: 15,weight: .regular))
                                Spacer()
                                Spacer()
                            }
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .foregroundColor(LMColor.logoColor)
                    .background(LMColor.backgroundColor)
                }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        anotherViewKeyboardIsFocused = false
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
        return CustomerDetailView(myQuote: Binding.constant(PropertyInfo()), customers: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
