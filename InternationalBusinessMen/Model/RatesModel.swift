//
//  ratesModel.swift
//  InternationalBusinessMen
//
//  Created by Claudenir on 02/02/2023.
//

import Foundation

/// Model Data rate
struct Rate: Identifiable, Codable {
    var id: String = UUID().uuidString
    let from: String
    let to: String
    let rate: Double
    
    enum CodingKeys: String, CodingKey {
        case from
        case to
        case rate
    }
    
    init(from: String, to: String, rate: Double) {
        self.from = from
        self.to = to
        self.rate = rate
        self.id = UUID().uuidString
    }
}
