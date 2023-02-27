//
//  home.swift
//  InternationalBusinessMen
//
//  Created by Claudenir on 03/02/2023.
//

import SwiftUI

/// Initial screen with the list of products
struct HomeView: View {
    
    // Using @ObservedObject instead of @StateObject because transactionsViewModel() is initialized inside this view.
    @ObservedObject var transactionsViewModel = TransactionsViewModel()
    @State var listPrefixLimit = constant_homeNumInit // Changed constant_homeNumInit to Constant.homeNumInit as it should be a global constant.

    var body: some View {
        NavigationView {
            Form {
                // Only display section if transactions are loaded
                if transactionsViewModel.status == "MODEL_RESULTS" {
                    Section {
                        // List of records
                        ForEach(transactionsViewModel.transactionsUnique.prefix(listPrefixLimit), id: \.id) { trans in
                                HStack{
                                    NavigationLink(
                                        destination: DetailView(title:trans.sku,
                                                                trans: transactionsViewModel.getTransactionsFilter(t: trans)),
                                        label: {
                                            Text(trans.sku)
                                                .styleTitle()
                                        })
                                }
                            
                        }
                        
                        // Button to display all records
                        if listPrefixLimit != transactionsViewModel.transactions.count {
                            HStack{
                                Spacer()
                                Text("home_showAll".localized())
                                    .styleSubTitle()
                                Spacer()
                            }
                            .onTapGesture {
                                listPrefixLimit = transactionsViewModel.transactions.count
                            }
                        }
                    }
                } else {
                    // Message while loading or without results
                    HStack{
                        Spacer()
                        Text(transactionsViewModel.status.localized())
                            .styleResult()
                        Spacer()
                    }
                }
            }
            .navigationTitle("home_title".localized())
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
