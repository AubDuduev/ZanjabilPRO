//
//  RequestsRESTService.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 28.05.2022.
//
import Foundation

final class RequestsRESTService {
	
	// MARK: - POST
	public func postSuggestionsAddress(with encAddressSuggestion: ENCAddressSuggestion, completion: @escaping Closure<[DECAddressSuggestion]?>){
		let postAddressSuggestion = POSTAddressSuggestion()
		postAddressSuggestion.request(data: encAddressSuggestion) { requestResult in
			DispatchQueue.main.async {
				switch  requestResult {
					case .error(let error):
						print(error ?? "")
					case .object(let decAddressSuggestions):
						let decAddressSuggestion = decAddressSuggestions as? DECAddressSuggestions
						let decAddressSuggestions = decAddressSuggestion?.addresses as? [DECAddressSuggestion]
						completion(decAddressSuggestions)
				}
			}
		}
	}
	
	public func postReverseGeocoding(with coordinate: ENCCoordinate, completion: @escaping Closure<[DECAddressSuggestion]?>){
		let postReverseGeocoding = POSTReverseGeocoding()
		postReverseGeocoding.request(data: coordinate) { requestResult in
			DispatchQueue.main.async {
				switch  requestResult {
					case .error(let error):
						print(error ?? "")
					case .object(let decAddressSuggestions):
						let decAddressSuggestion = decAddressSuggestions as? DECAddressSuggestions
						let decAddressSuggestions = decAddressSuggestion?.addresses as? [DECAddressSuggestion]
						completion(decAddressSuggestions)
				}
			}
		}
	}
	// MARK: - GET
	public func getYandexReverseGeocoding(with parameters: ParametersYandexReverseGeocoding, completion: @escaping Closure<DECYandexGEOObject?>){
		let getYandexReverseGeocoding = GETYandexReverseGeocoding()
		getYandexReverseGeocoding.request(data: parameters) { requestResult in
			DispatchQueue.main.async {
				switch  requestResult {
					case .error(let error):
						print(error ?? "")
					case .object(let yandexReverseGeocoding):
						let yandexReverseGeocoding = yandexReverseGeocoding as? DECYandexReverseGeocoding
						let yandexGEOObject        = yandexReverseGeocoding?.response?.geoObjectCollection?.collection?.first?.geoObjects
						completion(yandexGEOObject)
				}
			}
		}
	}
}

