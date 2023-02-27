//
//  ratesModel.swift
//  InternationalBusinessMen
//
//  Created by Claudenir on 02/02/2023.
//

import Foundation
import Combine

/// ViewModel of Rates
class RatesViewModel: ObservableObject {
    
    //MARK: - Published Properties
    
    @Published var rates = [Rate]()
    @Published var status: String = "MODEL_NO_LOAD" // status of load with result or no

    // Manager error
    @Published var rateListLoadingError: String = ""
    @Published var showAlert: Bool = false

    //MARK: - Private Properties
    
    private var cancellableSet: Set<AnyCancellable> = []
    private var dataManager: APIServicesProtocol
    
    //MARK: - Initialization
    
    init(dataManager: APIServicesProtocol = APIServices.shared) {
        self.dataManager = dataManager
        getRatesList()
    }
    
    //MARK: - Public Methods
    
    /// Call the Rates API to get the list of rates
    func getRatesList() {
        dataManager.callRates()
            .sink { [weak self] (dataResponse) in
                guard let self = self else { return }
                if let error = dataResponse.error {
                    self.createAlert(with: error)
                } else {
                    self.rates = dataResponse.value!
                    if self.rates.count > 0 {
                        self.status = "MODEL_RESULTS"
                    } else {
                        self.status = "MODEL_NO_RESULT"
                    }
                }
            }.store(in: &cancellableSet)
    }

    /// Find the exchange rate for a given currency
    ///
    /// - Parameters:
    ///     - from: The name of the currency to convert from
    ///     - value: The value to convert
    ///
    /// - Returns: A tuple containing the currency to convert to and the converted value
    func getExchangeRate(from: String, value: Double) -> (to: String, value: Double) {
        // If the currency to convert from is the same as the constant_RateMain, no conversion is needed
        if constant_RateMain.uppercased() == from.uppercased() {
            return(from,value)
        }
        // Look for the rate for the given currency
        if let rate = rates.first(where: { $0.from.uppercased() == from.uppercased() }) {
            let newValue = value * rate.rate
            return getExchangeRate(from: rate.to, value: newValue)
        }
        // If no rate was found, return the original values
        return(from,value)
    }

    //MARK: - Private Methods
    
    /// Create an alert message with the given error
    ///
    /// - Parameter error: The error to display in the alert
    private func createAlert(with error: ErrorServices ) {
        rateListLoadingError = error.backendError?.message ?? error.initialError.localizedDescription
        self.showAlert = true
    }
}
