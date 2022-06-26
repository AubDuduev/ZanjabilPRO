import UIKit
import Foundation

extension Double {
	
	var toString: String {
		return String(self)
	}
	
	func format(_ formatDate: FormatDate) -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = formatDate.rawValue
		let result = dateFormatter.string(from: Date(timeIntervalSince1970: self))
		return result
	}
	//transform in time
	func getLastMessageTime() -> String {
		let dateFormater = DateFormatter()
		let calendar     = Calendar.current
		let date         = Date(timeIntervalSince1970: self)
		dateFormater.dateFormat = "dd MMMM"
		//Sorted title date message
		switch true {
				//today message
			case calendar.isDateInToday(date):
				dateFormater.dateFormat = "HH:mm"
				return dateFormater.string(from: date)
				//Yesterday message
			case calendar.isDateInYesterday(date):
				return "Вчера"
				//all message
			default:
				return dateFormater.string(from: date)
		}
	}
	enum FormatDate: String {
		case time         = "HH:mm"
		case monthDay     = "MM.dd"
		case monthDayYear = "MM.dd.yy"
		case dayMonthText = "dd MMMM"
		case long         = "MMMM d, yyyy"
	}
	enum FormatDistance: String {
		
		case km
		case m
	}
	func distanceType(_ type: FormatDistance) -> String {
		switch type {
			case .km:
				return String( (self / 1000).roundTo(2) ) + " km"
			case .m:
				return String(self) + " m"
		}
	}
	func roundTo(_ fractionDigits: Int) -> Double {
		let multiplier = pow(10, Double(fractionDigits))
		return Darwin.round(self * multiplier) / multiplier
	}
	//Получаем от форматированную строку с буквами указатели количество нулей
	func formattingWithLetter(_ countAfterDot: Int) -> String {
		
		let firstPart        = Int(String(self).split(separator: ".")[0])!
		let secondPartString = String(self).split(separator: ".")[1]
		let secondPart       = secondPartString.prefix((countAfterDot))
		
		if firstPart >= 10000, firstPart <= 999999 {
			let resultOne = Int(firstPart/1000)
			return String(resultOne) + "." + String(secondPart) + "K"
		}
		
		if firstPart > 999999 {
			let resultOne = Int(firstPart/1000000)
			return String(resultOne) + "." + String(secondPart) + "M"
		}
		
		return String(firstPart) + "." + String(secondPart)
	}
	
}
