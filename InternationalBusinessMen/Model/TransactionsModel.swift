//
//  transactionsModel.swift
//  InternationalBusinessMen
//
//  Created by Claudenir on 02/02/2023.
//

import Foundation

/// Model Data transaction
struct Transaction: Identifiable, Codable {
    // Add default value to id using UUID
    var id: String = UUID().uuidString
    let sku: String
    let amount: Double
    let currency: String
    
    // Define CodingKeys enum to customize property names when encoding and decoding
    enum CodingKeys: String, CodingKey {
        case sku
        case amount
        case currency
    }
}
