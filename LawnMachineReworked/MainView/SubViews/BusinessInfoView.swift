//
//  BusinessInfoView.swift
//  LawnMachineReworked
//
//  Created by Joshua Hauer on 7/29/24.
//

import SwiftUI
import SwiftData

struct BusinessInfoView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    BisInfoTextView(myCustomers: NewCustomer(name: "", subscription: Int(), address: "", dateSubmitted: Date(), sqrft: Int(), hedgeTotal: Int(), priceChosen: Double(), notes: ""))
                }
                .toolbar {
                    ToolbarItem(placement:.topBarLeading) {
                        VStack{
                            Spacer()
                            HStack {
                                Text("Lawn Machine")
                                    .font(.system(size: 32,weight: .bold))
                                    .foregroundStyle(LMColor.logoColor)
                                Image(systemName:"gear")
                                    .foregroundStyle(LMColor.logoColor)
                                    .font(.title.bold())
                            }
                            HStack {
                                Text("Business Information")
                                    .font(.system(size: 15,weight: .regular))
                                    .foregroundStyle(LMColor.logoColor)
                                Spacer()
                            }
                            Spacer()
                            Spacer()
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .foregroundColor(LMColor.logoColor)
                .background(LMColor.backgroundColor)
            }
        }
    }
}

#Preview {
    BusinessInfoView()
}
