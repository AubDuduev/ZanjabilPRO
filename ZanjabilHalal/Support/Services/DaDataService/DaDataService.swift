//
//
//  DaDataService.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 21.05.2022.
//
//
import Combine
import Resolver
import Foundation

final class DaDataService: ServiceProtocol {
	
	@Injected
	private var requestsRESTService: RequestsRESTService
  
    public var suggestionsAddressesList = PassthroughSubject<[DECAddressSuggestion], Never>()
	
	public func getSuggestionAddress(with encAddressSuggestion: ENCAddressSuggestion, completion: @escaping Closure<[DECAddressSuggestion]?>){
		self.requestsRESTService.postSuggestionsAddress(with: encAddressSuggestion, completion: completion)
	}
	
	public func getSuggestionAddress(with encAddressSuggestion: ENCAddressSuggestion){
		self.requestsRESTService.postSuggestionsAddress(with: encAddressSuggestion) { suggestionsAddresses in
			guard let suggestionsAddresses = suggestionsAddresses else { return }
			self.suggestionsAddressesList.send(suggestionsAddresses)
		}
	}
}
