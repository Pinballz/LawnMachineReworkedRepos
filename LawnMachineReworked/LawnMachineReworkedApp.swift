//
//  LawnMachineReworkedApp.swift
//  LawnMachineReworked
//
//  Created by Joshua Hauer on 7/29/24.
//

import SwiftUI
import SwiftData

@main
struct LawnMachineReworkedApp: App {

    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
        .modelContainer(for: NewCustomer.self)
    }
}
