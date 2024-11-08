//
//  RecentTransactionList.swift
//  ExpenseTracker
//
//  Created by Elena Kholodilina on 11/7/24.
//

import SwiftUI

struct RecentTransactionList: View {
    @Environment(TransactionListViewModel.self) private var transactionListVM
    
    var body: some View {
        VStack {
            HStack {
                Text("Recent transaction")
                    .fontWeight(.bold)
                Spacer()
                NavigationLink {
                    TransactionList()
                } label: {
                    HStack(spacing: 4) {
                        Text("See all")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundStyle(.customText)
                }

            }
            .padding(.top)
            
            ForEach(Array(transactionListVM.transactions.prefix(5).enumerated()), id: \.element) { index, transaction in
                TransactionRow(transaction: transaction)
                Divider()
                    .opacity(index != 4 ?  1 : 0)
            }
        }
        .padding()
        .background(.background)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: .primary.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

#Preview {
    NavigationView {
        RecentTransactionList()
            .environment(TransactionListViewModel())
    }
}
