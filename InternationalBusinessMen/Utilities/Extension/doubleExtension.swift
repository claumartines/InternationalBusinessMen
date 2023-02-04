//
//  doubleExtension.swift
//  InternationalBusinessMen
//
//  Created by Claudenir on 04/02/2023.
//

import Foundation

extension Double {
    
    /// Using a Double extension custom method built with Darwin round and pow functions
    ///
    /// - Parameter fractionDigits: Digits
    func roundToDecimal(_ fractionDigits: Int) -> Double {
        let multiplier = pow(10, Double(fractionDigits))
        return Darwin.round(self * multiplier) / multiplier
    }
}
