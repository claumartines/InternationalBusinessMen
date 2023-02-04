import Foundation
import Alamofire
import Combine
import UIKit


extension APIServices : APIServicesProtocol{
    
    
    /// Responsible for return rates.
    func callRates() -> AnyPublisher<Alamofire.DataResponse<[rate], ErrorServices>, Never> {
        return AF.request(URL.rates()!,
                          method: .get)
        .validate()
        .publishDecodable(type: [rate].self)
        .map { response in
            response.mapError { error in
                let backendError = response.data.flatMap { try? JSONDecoder().decode(ErrorServicesBackend.self, from: $0)}
                return ErrorServices(initialError: error, backendError: backendError)
            }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
    /// Responsible for return Transactions
    func callTransactions() -> AnyPublisher<Alamofire.DataResponse<[transaction], ErrorServices>, Never> {
        return AF.request(URL.transactions()!,
                          method: .get)
        .validate()
        .publishDecodable(type: [transaction].self)
        .map { response in
            response.mapError { error in
                let backendError = response.data.flatMap { try? JSONDecoder().decode(ErrorServicesBackend.self, from: $0)}
                return ErrorServices(initialError: error, backendError: backendError)
            }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
}


