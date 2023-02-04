//
//  ratesView.swift
//  InternationalBusinessMen
//
//  Created by Claudenir on 04/02/2023.
//

import SwiftUI

/// Rates screen with rates list
struct ratesView: View {
    
    var rates:[rate] // List Rates

    var body: some View {
        
        VStack{
            // List of Rates
            Form {
                Section {
                    ForEach(rates, id: \.id) { rateObject in
                        cellRate(from: rateObject.from,
                                 rate: rateObject.rate,
                                 to: rateObject.to)
                    }
                }
            }
        }
        .navigationTitle("rates_title")
    }
}
