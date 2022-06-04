//
//  AmountService.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 26.03.2022.
//
import Foundation

final class AmountService {
    
    static func rub(with amount: Decimal) -> String {
        let formatter = NumberFormatter()
        //formatter.usesGroupingSeparator = true
        formatter.numberStyle = .decimal
        formatter.numberStyle = .currency
        formatter.locale      = Locale(identifier: "ru_RUS")
        formatter.decimalSeparator = "."
        //formatter.groupingSeparator = "."
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 2
        let amountString = formatter.string(from: amount as NSNumber) ?? "0"
        return amountString
    }
    
    static func toFloat(with value: String) -> Float? {
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .decimal
        formatter.decimalSeparator = "."
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        let result = formatter.number(from: value)
        
        return result?.floatValue ?? 0
    }
    
    static func rub() {
       // String(format: "%.2f", 0)
    }
}
