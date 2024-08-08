//
//  ContentView.swift
//  LawnMachineReworked
//
//  Created by Joshua Hauer on 7/29/24.
//

import SwiftUI
import SwiftData




struct MainTabView: View {
    
    @Environment(\.modelContext) var context
    
    @State private var myQuote = PropertyInfo()
    
    @State private var businessInfo = BusinessInfo()
    
    var body: some View {
        TabView {
            CustomerView(businessInfo: $businessInfo)
                .tabItem {
                    Label("Accounts", systemImage: "house")
                }
            QuoteGeneratorView(myQuote: $myQuote, businessInfo: $businessInfo)
                .tabItem {
                    Label("Quote", systemImage: "pencil.and.scribble")
                }
            BusinessInfoView(businessInfo: $businessInfo)
                .tabItem {
                    Label("The Books", systemImage: "book.pages")
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
