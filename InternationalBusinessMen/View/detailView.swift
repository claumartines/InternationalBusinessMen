//
//  detailView.swift
//  InternationalBusinessMen
//
//  Created by Claudenir on 03/02/2023.
//

import SwiftUI

/// Detail screen with transition list of a product
struct detailView: View {
    
    @ObservedObject var ratesModel = ratesViewModel()
    var title:String
    var trans:[transaction]
    
    @State var total:Double = 0
    
    var body: some View {
        
        VStack{
            NavigationView {
                Form {
                    // List transition of a Product
                    ForEach(trans, id: \.id) { tran in
                        HStack{
                            Text(String(format: "%.2f",tran.amount.roundToDecimal(2)))
                                .styleRegular()
                            
                            Text("(" + tran.currency + ")")
                                .styleSubTitle()
                            Spacer()
                            Text("=")
                                .styleSubTitle()
                            Spacer()
                            
                            // CALCULATE CHANGE
                            if ratesModel.status == "MODEL_RESULTS" {
                                Text(String(format: "%.2f",ratesModel.getChanger(from: tran.currency, value: tran.amount).value.roundToDecimal(2)))
                                    .styleRegular()
                            } else {
                                Text(ratesModel.status)
                                    .styleRegular()
                            }
                            Text("(" + constant_RateMain + ")")
                                .styleSubTitle()
                        }
                    }
                    
                    // SUM TOTAL
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
            .toolbar {
                // Button to see the list of rates
                NavigationLink(
                    destination: ratesView(rates: ratesModel.rates),
                    label: {
                        Text("detail_btnRates")
                    })

                
            }
            .navigationTitle(title)
        }
        .onAppear{
            calculateTotal()
        }
    }
    
    // Calculate Total Sum
    func calculateTotal(){
        total = 0
        for tran in trans {
            total += ratesModel.getChanger(from: tran.currency, value: tran.amount).value
        }
    }
}
