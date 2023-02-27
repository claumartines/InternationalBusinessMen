//
//  detailView.swift
//  InternationalBusinessMen
//
//  Created by Claudenir on 03/02/2023.
//

import SwiftUI

/// Detail screen with transition list of a product
struct DetailView: View {
    
    // MARK: - Properties
    
    // ViewModel to fetch rates data
    @ObservedObject var ratesModel = RatesViewModel()
    
    // Title for the detail view
    var title: String
    
    // List of transactions for a product
    var trans: [Transaction]
    
    // Total sum of all transactions
    @State private var total: Double = 0
    
    // MARK: - Body
    
    var body: some View {
        
        VStack {
            // Navigation view for the detail screen
            NavigationView {
                // Form to display transaction details
                Form {
                    // List transition of a Product
                    ForEach(trans, id: \.id) { tran in
                        HStack{
                            // Transaction amount
                            Text(String(format: "%.2f",tran.amount.roundToDecimal(2)))
                                .styleRegular()
                            
                            // Transaction currency
                            Text("(" + tran.currency + ")")
                                .styleSubTitle()
                            Spacer()
                            
                            // "equals" symbol
                            Text("=")
                                .styleSubTitle()
                            Spacer()
                            
                            // Converted transaction value
                            if ratesModel.status == "MODEL_RESULTS" {
                                Text(String(format: "%.2f", ratesModel.getExchangeRate(from: tran.currency, value: tran.amount).value.roundToDecimal(2)))
                                    .styleRegular()
                            } else {
                                Text(ratesModel.status)
                                    .styleRegular()
                            }
                            
                            // Currency used for conversion
                            Text("(" + constant_RateMain + ")")
                                .styleSubTitle()
                        }
                    }
                    
                    // Total sum of all transactions
                    if total > 0 {
                        HStack{
                            Text("detail_total")
                                .styleBold()
                            Spacer()
                            Text(String(format: "%.2f",total))
                                .styleTitle()
                            Text("(" + constant_RateMain + ")")
                                .styleSubTitle()
                        }
                    }
                }
            }
            // Toolbar to show the list of rates
            .toolbar {
                NavigationLink(
                    destination: RatesView(rates: ratesModel.rates),
                    label: {
                        Text("detail_btnRates")
                    })
            }
            .navigationTitle(title)
        }
        // Calculate the total sum when the view appears
        .onAppear{
            calculateTotal()
        }
    }
    
    // MARK: - Private functions
    
    /// Calculate the total sum of all transactions
    func calculateTotal() {
        total = 0
        for tran in trans {
            total += ratesModel.getExchangeRate(from: tran.currency, value: tran.amount).value
        }
    }
}
