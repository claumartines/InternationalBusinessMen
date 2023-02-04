//
//  transactionsModel.swift
//  InternationalBusinessMen
//
//  Created by Claudenir on 02/02/2023.
//

import Foundation

/// Model Data transaction
struct transaction: Identifiable, Codable {
    var id: String = UUID().uuidString
    let sku: String
    let amount: Double
    let currency: String
    
    enum CodingKeys: String, CodingKey {
        case sku
        case amount
        case currency
    }
}

