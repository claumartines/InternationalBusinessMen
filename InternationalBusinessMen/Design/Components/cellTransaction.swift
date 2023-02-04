//
//  SwiftUIView.swift
//  InternationalBusinessMen
//
//  Created by Claudenir on 03/02/2023.
//

import SwiftUI

struct cellTransaction: View {
        
    let sku:String
    let amount:Double
    let currency:String

    var body: some View {
        HStack{
            
            Text(sku)
                .styleTitle()
            
            Spacer()
            
            Text(String(format: "%.2f",amount.roundToDecimal(2)))
                .styleRegular()
            
            Text("(" + currency + ")")
                .styleSubTitle()

        }
    }
}
