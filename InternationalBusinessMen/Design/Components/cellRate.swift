//
//  cellRate.swift
//  InternationalBusinessMen
//
//  Created by Claudenir on 03/02/2023.
//

import Foundation
import SwiftUI

struct CellRate: View {
        
    let from:String
    let rate:Double
    let to:String

    var body: some View {
        VStack {
            HStack{
                
                Text(from)
                    .styleTitle()
                
                Text("detail_to")
                    .styleSubTitle()
                Text(to)
                    .styleTitle()
                Spacer()

                Text(String(format: "%.2f",rate.roundToDecimal(2)))
                    .styleRegular()
                Text("(" + to + ")")
                    .styleSubTitle()
            }
        }
    }
}
