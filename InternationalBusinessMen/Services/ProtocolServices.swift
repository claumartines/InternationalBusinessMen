//
//  protocolServices.swift
//  InternationalBusinessMen
//
//  Created by Claudenir on 03/02/2023.
//

import Foundation
import Combine
import Alamofire

protocol APIServicesProtocol {
    func callRates() -> AnyPublisher<DataResponse<[rate], ErrorServices>, Never>
    func callTransactions() -> AnyPublisher<DataResponse<[transaction], ErrorServices>, Never>
}
