//
//  CustomerPropertyInfo.swift
//  LawnMachineReworked
//
//  Created by Joshua Hauer on 7/29/24.
//

import Foundation



struct PropertyInfo: Identifiable {
    let id = UUID()
    var newName = ""
    var newSub = 0
    var newAddress = ""
    var newDate = Date.now
    var sqrft: Int?
    var hedgeTotal:Int?
    var priceChosen = 0.0
}
