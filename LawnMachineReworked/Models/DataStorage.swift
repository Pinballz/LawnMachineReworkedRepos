//
//  DateStorage.swift
//  LawnMachineReworked
//
//  Created by Joshua Hauer on 7/30/24.
//

import Foundation
import SwiftData


@Model
class DataStorage: Identifiable {
    
    var id: String
    var name: String
    var subscription: Int
    var address: String
    var dateSubmitted: Date
    var sqrft: Int?
    var hedgeTotal: Int?
    var priceChosen: Double
    var subIncome: Int?
    
    init(name: String, subscription: Int, address: String, dateSubmitted: Date, sqrft: Int? = nil, hedgeTotal: Int? = nil, priceChosen: Double, subIncome: Int? = nil) {
        self.id = UUID().uuidString
        self.name = name
        self.subscription = subscription
        self.address = address
        self.dateSubmitted = dateSubmitted
        self.sqrft = sqrft
        self.hedgeTotal = hedgeTotal
        self.priceChosen = priceChosen
        self.subIncome = subIncome
    }
    

}
