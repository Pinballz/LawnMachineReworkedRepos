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
    
    var body: some View {
        TabView {
            CustomerView(myQuote: $myQuote)
                .tabItem {
                    Label("Accounts", systemImage: "house")
                }
            QuoteGeneratorView(myQuote: $myQuote)
                .tabItem {
                    Label("Quote", systemImage: "pencil.and.scribble")
                }
            BusinessInfoView()
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
