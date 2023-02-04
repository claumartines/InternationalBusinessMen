//
//  ratesModel.swift
//  InternationalBusinessMen
//
//  Created by Claudenir on 02/02/2023.
//

import Foundation
import Combine

/// ViewModel of Rates
class ratesViewModel: ObservableObject {
    
    @Published var rates =  [rate]()
    @Published var status: String = "MODEL_NO_LOAD" // status of load with result or no

    // Manager error
    @Published var rateListLoadingError: String = ""
    @Published var showAlert: Bool = false

    private var cancellableSet: Set<AnyCancellable> = []
    var dataManager: APIServicesProtocol
    
    init( dataManager: APIServicesProtocol = APIServices.shared) {
        self.dataManager = dataManager
        getRatesList()
    }
    
    // call request list
    func getRatesList() {
        dataManager.callRates()
            .sink { (dataResponse) in
                if dataResponse.error != nil {
                    self.createAlert(with: dataResponse.error!)
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

    /// Search for currencies to calculate the exchange rate
    ///
    /// - Parameter from: Name Rate
    /// - Parameter Value: Value Rate
    ///
    /// - return: the to and value convert
    func getChanger(from:String, value:Double) -> (to: String, value: Double) {
        // I check if I have already found
        if constant_RateMain.uppercased() == from.uppercased() {
            return(from,value)
        }
        // I am looking for the currency
        if let r = rates.first(where: { $0.from == from }) {
            let newValue = value * r.rate
            return getChanger(from: r.to, value: newValue)
        }
        return(from,value)
    }

    
    func createAlert( with error: ErrorServices ) {
        rateListLoadingError = error.backendError == nil ? error.initialError.localizedDescription : error.backendError!.message
        self.showAlert = true
    }
}
