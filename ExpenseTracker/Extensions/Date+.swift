//
//  Date+.swift
//  ExpenseTracker
//
//  Created by Elena Kholodilina on 11/7/24.
//

import Foundation

extension DateFormatter {
    static let allNumericUSA: DateFormatter = {
        print("Initializing DateFormatter")
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"

        return formatter
    }()
}

extension String {
    func dateParsed() -> Date {
        guard let parsedDate = DateFormatter.allNumericUSA.date(from: self) else { return Date() }

        return parsedDate
    }
}
