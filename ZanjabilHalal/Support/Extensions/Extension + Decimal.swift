import Foundation

extension Decimal {
    
    var toInt: Int {
        return NSDecimalNumber(decimal: self).intValue
    }
    
    var toDouble: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
    
    var toString: String {
        return NSDecimalNumber(decimal: self).stringValue
    }

    
    mutating func round(_ scale: Int, _ roundingMode: NSDecimalNumber.RoundingMode) {
        var localCopy = self
        NSDecimalRound(&self, &localCopy, scale, roundingMode)
    }
    
    func rounded(_ scale: Int, _ roundingMode: NSDecimalNumber.RoundingMode) -> Decimal {
        var result = Decimal()
        var localCopy = self
        NSDecimalRound(&result, &localCopy, scale, roundingMode)
        return result
    }
    
}
