import Foundation
import Alamofire
import Combine

// Extending the APIServices class to conform to the APIServicesProtocol
extension APIServices: APIServicesProtocol {
    
    // Function to fetch rates from the server
    func callRates() -> AnyPublisher<Alamofire.DataResponse<[Rate], ErrorServices>, Never> {
        
        // Making the API call using Alamofire
        return AF.request(URL.rates()!, method: .get)
            
            // Validating the response received from the server
            .validate()
            
            // Decoding the JSON response into an array of Rate objects
            .publishDecodable(type: [Rate].self)
            
            // Handling errors if any during decoding
            .map { response in
                response.mapError { error in
                    let backendError = response.data.flatMap { try? JSONDecoder().decode(ErrorServicesBackend.self, from: $0)}
                    return ErrorServices(initialError: error, backendError: backendError)
                }
            }
            
            // Sending the response on main thread
            .receive(on: DispatchQueue.main)
            
            // Converting the response into an AnyPublisher
            .eraseToAnyPublisher()
    }
    
    // Function to fetch transactions from the server
    func callTransactions() -> AnyPublisher<Alamofire.DataResponse<[Transaction], ErrorServices>, Never> {
        
        // Making the API call using Alamofire
        return AF.request(URL.transactions()!, method: .get)
            
            // Validating the response received from the server
            .validate()
            
            // Decoding the JSON response into an array of Transaction objects
            .publishDecodable(type: [Transaction].self)
            
            // Handling errors if any during decoding
            .map { response in
                response.mapError { error in
                    let backendError = response.data.flatMap { try? JSONDecoder().decode(ErrorServicesBackend.self, from: $0)}
                    return ErrorServices(initialError: error, backendError: backendError)
                }
            }
            
            // Sending the response on main thread
            .receive(on: DispatchQueue.main)
            
            // Converting the response into an AnyPublisher
            .eraseToAnyPublisher()
    }
    
}
