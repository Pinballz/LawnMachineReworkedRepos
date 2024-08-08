//
//  NewCustomerInfo.swift
//  LawnMachineReworked
//
//  Created by Joshua Hauer on 7/29/24.
//

import Foundation
import SwiftData

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
     let totalSubIncome: Int?
    
    init(name: String, subscription: Int, address: String, dateSubmitted: Date, sqrft: Int?, hedgeTotal: Int?, priceChosen: Double, totalSubIncome: Int?) {
        self.name = name
        self.subscription = subscription
        self.address = address
        self.dateSubmitted = dateSubmitted
        self.sqrft = sqrft
        self.hedgeTotal = hedgeTotal
        self.priceChosen = priceChosen
        self.totalSubIncome = totalSubIncome
    }
}

extension Double {
    func removeZerosFromEnd() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return String(formatter.string(from: number) ?? "")
    }
}
