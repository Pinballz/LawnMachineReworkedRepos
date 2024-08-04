//
//  NewCustomerInfo.swift
//  LawnMachineReworked
//
//  Created by Joshua Hauer on 7/29/24.
//

import Foundation
import SwiftData

struct NewCustomer: Identifiable, Encodable {
     let id = UUID()
     let name: String
     let subscription: Int
     let address: String
     let dateSubmitted: Date
     let sqrft: Int?
     let hedgeTotal: Int?
     let priceChosen: Double
}


final class CustomerViewModel: ObservableObject {
   @Published var customers: [NewCustomer] = []
    func getCustomers(newCustomer: NewCustomer) {
        customers.append(newCustomer)
    }
    func removeCustomers(offsets: IndexSet) {
        customers.remove(atOffsets: offsets)
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
