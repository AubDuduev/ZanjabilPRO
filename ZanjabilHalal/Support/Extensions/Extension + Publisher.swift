//
//  Extensions + Publisher.swift
//  Osago
//
//  Created by Senior Developer on 04.03.2022.
//
import Combine
import Foundation

// MARK: - 1
extension Publisher where Output == Data {
//    // MARK: - Парсим данные через объект StatusObject
//    // на выходе у нас данные которые мы получили с сервера и статус true/false ошибка/норм
//    func decodeStatus() -> Publishers.Map<Self, (Bool, Data)> {
//        map { data in
//            let decoderService = JSONDecoderService()
//            let statusObject   = decoderService.decode(jsonType: StatusObject.self, data: data)
//            let status = statusObject?.status ?? false
//            let result = (status, data)
//            return result
//        }
//    }
}
//// MARK: - 2 
//extension Publisher where Output == (Bool, Data) {
//    // MARK: - Парсим данные уже после ответа decodeStatus
//    func decodeObjects<T: Decodable>(with: T.Type) -> Publishers.TryMap<Self, T?>  {
//        tryMap({ (status, data) -> T? in
//            let decoderService = JSONDecoderService()
//            switch status {
//                    //получаем распарсеный ответ если (decodeStatus == true)
//                case true:
//                    let decodeObject = decoderService.decode(jsonType: T.self, data: data)
//                    return decodeObject
//                    //парсим ошибку ответ если (decodeStatus == false)
//                case false:
//                    let exception = decoderService.decode(jsonType: ExceptionResultObject.self, data: data)?.exception
//                    let error     = AppError(rawValue: exception?.code ?? "") ?? .unhandled
//                    Swift.print(exception as Any, "exception")
//                    throw error
//            }
//        })
//    }
//}
//// MARK: - 3
//extension Publisher where Output == AppError {
//    // MARK: - Парсим ошибку
//    func decodeError() -> Publishers.MapError<Self, Output>  {
//        mapError { error in
//            return AppError(error: error)
//        }
//    }
//}
//where Upstream : Publisher, Failure : Error
