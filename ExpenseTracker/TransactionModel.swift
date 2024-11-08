//
//  TransactionModel.swift
//  ExpenseTracker
//
//  Created by Elena Kholodilina on 11/7/24.
//

import Foundation

struct Transaction: Identifiable, Decodable, Hashable {
    let id: Int
    let date: String
    let institution: String
    let account: String
    var merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    var categoryId: Int
    var category: String
    let isPending: Bool
    var isTransfer: Bool
    var isExpense: Bool
    var isEdited: Bool
    
    var dateParsed: Date {
        date.dateParsed()
    }
    
    var signedAmount: Double {
        return type == TransactionType.credit.rawValue ? amount : -amount
    }

    var icon: String {
        if let category = Category.all.first(where: { $0.id == categoryId }) {
            return category.icon
        }

        return ""
    }
    
    var month: String {
        dateParsed.formatted(.dateTime.year().month(.wide))
    }
}

enum TransactionType: String {
    case debit = "debit"
    case credit = "credit"
}

struct Category {
    let id: Int
    let name: String
    let icon: String
    var mainCategoryId: Int?
}

extension Transaction {
    static var transactionData: Transaction {
        Transaction(id: 1, date: "01/24/2022", institution: "Desjardins", account: "Visa Desjardins", merchant: "Apple", amount: 11.49, type: "debit", categoryId: 801, category: "Software", isPending: false, isTransfer: false, isExpense: true, isEdited: false)
    }
    
    static var transactionListPreviewData = [Transaction](repeating: transactionData, count: 10)
}

extension Category {
    static let autoAndTransport = Category(id: 1, name: "Auto & Transport", icon: "circle.hexagongrid")
    static let billsAndUtilities = Category(id: 2, name: "Bills & Utilities", icon: "command.circle")
    static let entertainment = Category(id: 3, name: "Entertainment", icon: "tornado.circle")
    static let feesAndCharges = Category(id: 4, name: "Fees & Charges", icon: "gear.circle")
    static let foodAndDining = Category(id: 5, name: "Food & Dining", icon: "circle.grid.3x3.circle")
    static let home = Category(id: 6, name: "Home", icon: "microbe.circle")
    static let income = Category(id: 7, name: "Income", icon: "tornado.circle")
    static let shopping = Category(id: 8, name: "Shopping", icon: "circle.grid.3x3.circle")
    static let transfer = Category(id: 9, name: "Transfer", icon: "gear.circle")

    static let publicTransportation = Category(id: 101, name: "Public Transportation", icon: "microbe.circle", mainCategoryId: 1)
    static let taxi = Category(id: 102, name: "Taxi", icon: "gamecontroller.circle", mainCategoryId: 1)
    static let mobilePhone = Category(id: 201, name: "Mobile Phone", icon: "tornado.circle", mainCategoryId: 2)
    static let moviesAndDVDs = Category(id: 301, name: "Movies & DVDs", icon: "microbe.circle", mainCategoryId: 3)
    static let bankFee = Category(id: 401, name: "Bank Fee", icon: "", mainCategoryId: 4)
    static let financeCharge = Category(id: 402, name: "Finance Charge", icon: "gear.circle", mainCategoryId: 4)
    static let groceries = Category(id: 501, name: "Groceries", icon: "circle.grid.3x3.circle", mainCategoryId: 5)
    static let restaurants = Category(id: 502, name: "Restaurants", icon: "gamecontroller.circle", mainCategoryId: 5)
    static let rent = Category(id: 601, name: "Rent", icon: "gamecontroller.circle", mainCategoryId: 6)
    static let homeSupplies = Category(id: 602, name: "Home Supplies", icon: "tornado.circle", mainCategoryId: 6)
    static let paycheque = Category(id: 701, name: "Paycheque", icon: "circle.grid.3x3.circle", mainCategoryId: 7)
    static let software = Category(id: 801, name: "Software", icon: "microbe.circle", mainCategoryId: 8)
    static let creditCardPayment = Category(id: 901, name: "Credit Card Payment", icon: "gear.circle", mainCategoryId: 9)
}

extension Category {
    static let categories: [Category] = [
        .autoAndTransport,
        .billsAndUtilities,
        .entertainment,
        .feesAndCharges,
        .foodAndDining,
        .home,
        .income,
        .shopping,
        .transfer
    ]

    static let subCategories: [Category] = [
        .publicTransportation,
        .taxi,
        .mobilePhone,
        .moviesAndDVDs,
        .bankFee,
        .financeCharge,
        .groceries,
        .restaurants,
        .rent,
        .homeSupplies,
        .paycheque,
        .software,
        .creditCardPayment
    ]

    static let all: [Category] = categories + subCategories
}
