//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Elena Kholodilina on 11/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    Text("Overview")
                        .font(.title2.bold())
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(.customBackground)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.customIcon, .primary)
                }
            }
        }
        .accentColor(.primary)
    }
}

#Preview {
    ContentView()
        .environment(TransactionListViewModel())
}
