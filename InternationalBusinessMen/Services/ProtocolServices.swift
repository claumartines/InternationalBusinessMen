//
//  protocolServices.swift
//  InternationalBusinessMen
//
//  Created by Claudenir on 03/02/2023.
//

import Foundation
import Combine
import Alamofire

/// Protocol for API services
protocol APIServicesProtocol {
    
    /// Function to make a call to get rates data
    ///
    /// - Returns: A publisher that emits a single value when the request completes
    func callRates() -> AnyPublisher<DataResponse<[Rate], ErrorServices>, Never>
    
    /// Function to make a call to get transactions data
    ///
    /// - Returns: A publisher that emits a single value when the request completes
    func callTransactions() -> AnyPublisher<DataResponse<[Transaction], ErrorServices>, Never>
}
