//
//  TransactionRow.swift
//  ExpenseTracker
//
//  Created by Elena Kholodilina on 11/7/24.
//

import SwiftUI

struct TransactionRow: View {
    var transaction: Transaction
    
    var body: some View {
        HStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(.customIcon.opacity(0.3))
                .frame(width: 44, height: 44)
                .overlay {
                    Image(systemName: transaction.icon)
                        .foregroundStyle(.customIcon)
                        .font(.title)
                }
            VStack(alignment: .leading, spacing: 6) {
                Text(transaction.merchant)
                    .font(.subheadline.bold())
                    .lineLimit(1)
                Text(transaction.category)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                
                Text(transaction.dateParsed, format: .dateTime.year().month().day())
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Text(transaction.signedAmount, format: .currency(code: "USD"))
                .bold()
                .foregroundColor(
                    transaction.type == TransactionType.credit.rawValue
                    ? .customText
                    : .primary
                )
        }
        .padding([.top, .bottom], 8)
    }
}

#Preview {
    TransactionRow(transaction: Transaction.transactionData)
}
