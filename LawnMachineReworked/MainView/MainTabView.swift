//
//  ContentView.swift
//  LawnMachineReworked
//
//  Created by Joshua Hauer on 7/29/24.
//

import SwiftUI
import SwiftData




struct MainTabView: View {

    @Environment(\.modelContext) private var context
    
    @Query private var dataStorage: [DataStorage]
    
    @ObservedObject private var customers = CustomerViewModel()
    
    @State private var myQuote = PropertyInfo()
    
    @State private var businessInfo = BusinessInfo()
    
    var body: some View {
        TabView {
            CustomerView(businessInfo: $businessInfo, customers: customers)
                .tabItem {
                    Image(systemName: "house")
                }
            QuoteGeneratorView(myQuote: $myQuote, businessInfo: $businessInfo, customers: customers)
                .tabItem {
                    Image(systemName: "pencil.and.scribble")
                }
            BusinessInfoView(businessInfo: $businessInfo, customers: customers)
                .tabItem {
                    Image(systemName: "book.pages")
                }
        }.tint(LMColor.logoColor)
            .onAppear {
                UITabBar.appearance().barTintColor = .none
            }
    }
}

#Preview {
    MainTabView()
}
