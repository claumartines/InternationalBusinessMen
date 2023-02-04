//
//  ratesModel.swift
//  InternationalBusinessMen
//
//  Created by Claudenir on 02/02/2023.
//

import Foundation

/// Model Data rate
struct rate: Identifiable, Codable {
    var id: String = UUID().uuidString
    let from: String
    let to: String
    let rate: Double
    
    enum CodingKeys: String, CodingKey {
        case from
        case to
        case rate
    }
}
