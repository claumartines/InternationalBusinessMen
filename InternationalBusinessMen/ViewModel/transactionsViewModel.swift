//
//  transactionsModel.swift
//  InternationalBusinessMen
//
//  Created by Claudenir on 02/02/2023.
//

import Foundation
import Combine

/// ViewModel of transactions
class transactionsViewModel: ObservableObject {
    
    @Published var transactions =  [transaction]() // all transactions
    @Published var transactionsUnique =  [transaction]() // only unique transactions
    @Published var status: String = "MODEL_NO_LOAD"  // status of load with result or no

    // Manager error
    @Published var transactionListLoadingError: String = ""
    @Published var showAlert: Bool = false

    private var cancellableSet: Set<AnyCancellable> = []
    var dataManager: APIServicesProtocol
    
    init(dataManager: APIServicesProtocol = APIServices.shared) {
        self.dataManager = dataManager
        getTransactionsList()
    }
    
    func getTransactionsList() {
        dataManager.callTransactions()
            .sink { (dataResponse) in
                if dataResponse.error != nil {
                    self.createAlert(with: dataResponse.error!)
                } else {
                    
                    // all list
                    self.transactions = dataResponse.value!.sorted { $0.sku < $1.sku }

                    // only unique list SKU
                    var transactionsUnique =  [transaction]()
                    for t in self.transactions {
                        if !transactionsUnique.contains(where: { $0.sku == t.sku }){
                            transactionsUnique.append(t)
                        }
                    }
                    self.transactionsUnique = transactionsUnique.sorted { $0.sku < $1.sku }
                    
                    // changer status
                    if self.transactions.count > 0 {
                        self.status = "MODEL_RESULTS"
                    } else {
                        self.status = "MODEL_NO_RESULT"
                    }
                }
            }.store(in: &cancellableSet)
    }

    /// Obtain the transaction list of a product
    ///
    /// - Parameter i: transaction of reference
    func getTransactionsFilter(t:transaction) -> [transaction] {
        var transactionsUnique =  [transaction]()
        for o in self.transactions {
            if (o.sku == t.sku){
                transactionsUnique.append(o)
            }
        }
        
        return transactionsUnique.sorted { $0.id < $1.id }
    }

    func createAlert( with error: ErrorServices ) {
        transactionListLoadingError = error.backendError == nil ? error.initialError.localizedDescription : error.backendError!.message
        self.showAlert = true
    }
}
