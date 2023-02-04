//
//  home.swift
//  InternationalBusinessMen
//
//  Created by Claudenir on 03/02/2023.
//

import SwiftUI

/// Initial screen with the list of products
struct homeView: View {

    @ObservedObject var transModel = transactionsViewModel()
    @State var listPrefixLimit = constant_homeNumInit

    
    var body: some View {
        NavigationView {
            Form {
                if transModel.status == "MODEL_RESULTS" {
                    Section {
                        // List of records
                        ForEach(transModel.transactionsUnique.prefix(listPrefixLimit), id: \.id) { trans in
                                HStack{
                                    NavigationLink(
                                        destination: detailView(title:trans.sku,
                                                                trans: transModel.getTransactionsFilter(t: trans)),
                                        label: {
                                            Text(trans.sku)
                                                .styleTitle()
                                        })
                                }
                            
                        }
                        // Button to display all records
                        if listPrefixLimit != transModel.transactions.count {
                            HStack{
                                Spacer()
                                Text("home_showAll")
                                    .styleSubTitle()
                                Spacer()
                            }
                            .onTapGesture {
                                listPrefixLimit = transModel.transactions.count
                            }
                        }
                    }
                } else {
                    // Message while loading or without results
                    HStack{
                        Spacer()
                        Text(transModel.status.localized())
                            .styleResult()
                        Spacer()
                    }
                }
            }
            .navigationTitle("home_title")
        }
    }
}

struct homeView_Previews: PreviewProvider {
    static var previews: some View {
        homeView()
    }
}
