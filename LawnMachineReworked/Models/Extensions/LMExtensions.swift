//
//  LMExtensions.swift
//  LawnMachineReworked
//
//  Created by Joshua Hauer on 8/10/24.
//

import Foundation

extension Double {
    func removeZerosFromEnd() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return String(formatter.string(from: number) ?? "")
    }
}
