//
//  TransactionList.swift
//  ExpenseTracker
//
//  Created by Elena Kholodilina on 11/7/24.
//

import SwiftUI

struct TransactionList: View {
    @Environment(TransactionListViewModel.self) private var viewModel
    
    var body: some View {
        VStack {
            List {
                ForEach(Array(viewModel.groupTransactionsByMonth()), id: \.key) { month, transactions in
                    Section {
                        ForEach(transactions, id: \.id) { transaction in
                            TransactionRow(transaction: transaction)
                        }
                    } header: {
                        Text(month)
                    }
                    .listSectionSeparator(.hidden)
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        TransactionList()
            .environment(TransactionListViewModel())
    }
}
