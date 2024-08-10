//
//  NewCustomerInfo.swift
//  LawnMachineReworked
//
//  Created by Joshua Hauer on 7/29/24.
//

import Foundation
import SwiftData
import UIKit

@Model
class NewCustomer: Identifiable {
    let id = UUID()
    let name: String
    let subscription: Int
    let address: String
    let dateSubmitted: Date
    let sqrft: Int?
    let hedgeTotal: Int?
    let priceChosen: Double
    var notes: String
    
    init(name: String, subscription: Int, address: String, dateSubmitted: Date, sqrft: Int?, hedgeTotal: Int?, priceChosen: Double, notes: String) {
        self.name = name
        self.subscription = subscription
        self.address = address
        self.dateSubmitted = dateSubmitted
        self.sqrft = sqrft
        self.hedgeTotal = hedgeTotal
        self.priceChosen = priceChosen
        self.notes = notes
    }
}


