import UIKit

final class Texts {
    
    enum Title: String, CaseIterable {
        
        case empty        = ""
        case error        = "ОШИБКА"
        case noNetwork    = "НЕТ ИНТЕРНЕТА"
        case save         = "Сохранен"
        case registration = "Регистрация"
        case information  = "Информация"
        case install      = "Установить"
        case delete       = "Удалить"
        
        private func localizedString() -> String {
            return NSLocalizedString(self.rawValue, comment: "")
        }
        
        func getTextFor(title: Title?) -> String {
            return title!.localizedString()
        }
    }
    enum Message: String, CaseIterable {
        
        case empty     = ""
        case delete    = "Хотите удалить?"
        case noNetwork = "Отсутствует подключение к сети, подключите Ваше устройство и попробуйте снова"
        case noJSON    = "Извините произошла ошибка получения данных"
        
        private func localizedString() -> String {
            return NSLocalizedString(self.rawValue, comment: "")
        }
        
        func getTextFor(message: Message?) -> String {
            return message!.localizedString()
        }
    }
    enum MessageCustom {
        case message(String)
    }
    enum Worning {
        case non
    }
    
    enum Project: String {
        
        case empty
        
        private func localizedString() -> String {
            return NSLocalizedString(self.rawValue, comment: "")
        }
        func getTextFor(_ text: Project?) -> String {
            return text!.localizedString()
        }
    }
    static func text(_ text: Project) -> String {
        return text.rawValue
    }
}


