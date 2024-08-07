//
//  BusinessInfoView.swift
//  LawnMachineReworked
//
//  Created by Joshua Hauer on 7/29/24.
//

import SwiftUI
import SwiftData

struct BusinessInfoView: View {
    
    @Binding var businessInfo: BusinessInfo
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    BisInfoTextView(businessInfo: $businessInfo)
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

#Preview {
    BusinessInfoView(businessInfo: .constant(BusinessInfo()))
}
