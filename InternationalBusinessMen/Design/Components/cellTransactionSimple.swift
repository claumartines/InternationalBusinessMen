//
//  SwiftUIView.swift
//  InternationalBusinessMen
//
//  Created by Claudenir on 03/02/2023.
//

import SwiftUI

struct cellTransactionSimple: View {
        
    let sku:String

    var body: some View {
        HStack{
            Spacer()
            Text(sku)
                .styleTitle()
            Spacer()
        }
    }
}
