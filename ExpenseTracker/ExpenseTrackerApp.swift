//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Elena Kholodilina on 11/7/24.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @State private var transactionListViewModel = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(transactionListViewModel)
        }
    }
}
