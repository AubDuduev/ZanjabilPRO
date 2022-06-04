import UIKit

//MARK: - Date format
extension String {
   
   func getDate(formatDate: FormatDate) -> Date? {
      let formater = DateFormatter()
      formater.dateFormat = formatDate.rawValue
      let date = formater.date(from: self)
      return date
   }
   enum FormatDate: String {
      case time             = "HH:mm"
      case monthDay         = "MM.dd"
      case monthDayYear     = "MM.dd.yy"
      case dayMonthYear     = "dd.MM.yy"
      case dayMonthText     = "dd MMMM"
      case dayMonthTextYear = "dd MMMM yyyy"
      case long             = "MMMM d, yyyy"
      case fcCalendar       = "yyyy-MM-dd"
      case orderDateTime    = "dd_MMMM_yyyy HH :mm :ss"
      case orderDatePath    = "dd_MMMM_yyyy/"
      case orderDate        = "dd_MMMM_yyyy"
      case longDateString   = "EEEE, MMM d, yyyy"
   }
}
