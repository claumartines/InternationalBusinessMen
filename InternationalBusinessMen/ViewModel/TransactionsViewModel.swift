//
//  transactionsModel.swift
//  InternationalBusinessMen
//
//  Created by Claudenir on 02/02/2023.
//
import Foundation
import Combine

/// ViewModel for transactions
class TransactionsViewModel: ObservableObject {
    
    // All transactions retrieved from the API
    @Published var transactions = [Transaction]()
    // Unique transactions retrieved from the API
    @Published var transactionsUnique = [Transaction]()
    // Status of load with result or no
    @Published var status: String = "MODEL_NO_LOAD"
    
    // Error handling
    @Published var transactionListLoadingError: String = ""
    @Published var showAlert: Bool = false
    
    // Set of AnyCancellable objects
    private var cancellableSet: Set<AnyCancellable> = []
    
    // API services protocol to manage data
    var dataManager: APIServicesProtocol
    
    init(dataManager: APIServicesProtocol = APIServices.shared) {
        self.dataManager = dataManager
        getTransactionsList()
    }
    
    // Call the API to retrieve transactions list
    func getTransactionsList() {
        dataManager.callTransactions()
            .sink { (dataResponse) in
                if dataResponse.error != nil {
                    // Handle error
                    self.createAlert(with: dataResponse.error!)
                } else {
                    // Sort all transactions by SKU
                    self.transactions = dataResponse.value!.sorted { $0.sku < $1.sku }
                    
                    // Get unique transactions by SKU
                    var transactionsUnique =  [Transaction]()
                    for t in self.transactions {
                        if !transactionsUnique.contains(where: { $0.sku == t.sku }){
                            transactionsUnique.append(t)
                        }
                    }
                    self.transactionsUnique = transactionsUnique.sorted { $0.sku < $1.sku }
                    
                    // Update status based on the count of transactions
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
    /// - Parameter t: transaction of reference
    func getTransactionsFilter(t:Transaction) -> [Transaction] {
        var transactionsUnique =  [Transaction]()
        for o in self.transactions {
            if (o.sku == t.sku){
                transactionsUnique.append(o)
            }
        }
        return transactionsUnique.sorted { $0.id < $1.id }
    }

    // Create an alert to display error
    func createAlert(with error: ErrorServices ) {
        transactionListLoadingError = error.backendError == nil ? error.initialError.localizedDescription : error.backendError!.message
        self.showAlert = true
    }
}
