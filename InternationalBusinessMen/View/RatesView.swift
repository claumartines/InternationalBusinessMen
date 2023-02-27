//
//  ratesView.swift
//  InternationalBusinessMen
//
//  Created by Claudenir on 04/02/2023.
//

import SwiftUI

/// Rates screen with rates list
struct RatesView: View {
    
    var rates: [Rate] // List of Rates

    var body: some View {
        VStack {
            // List of Rates
            Form {
                Section {
                    ForEach(rates, id: \.id) { rate in
                        CellRate(from: rate.from, rate: rate.rate, to: rate.to)
                    }
                }
            }
        }
        .navigationTitle("rates_title") // Set navigation bar title
    }
}
