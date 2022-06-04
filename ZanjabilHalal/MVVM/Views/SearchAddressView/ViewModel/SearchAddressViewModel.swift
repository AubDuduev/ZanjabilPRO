//
//  SearchAddressViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 29.05.2022.
//
import Resolver
import UIKit

final class SearchAddressViewModel: NSObject, MVVMViewModelProtocol {
    
    public var model: SearchAddressModel? {
        didSet { self.stateSearchAddressModel() }
    }
	// MARK: - DI
	@Injected
	private var daDataService: DaDataService
    //MARK: - implementation protocol
    public var mainView: SearchAddressView?
    public var isUpdate: ClosureEmpty?
    
    //MARK: - Main state view model
    private func stateSearchAddressModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties:
				let viewProperties = SearchAddressView.ViewProperties(searchTextFieldDelegate: self)
				self.mainView?.update(with: viewProperties)
            case .createAddress(let textAddress):
				guard let textAddress = textAddress else { return }
				let encAddressSuggestion = self.createAddressSuggestion(with: textAddress)
				self.daDataService.getSuggestionAddress(with: encAddressSuggestion)
        }
    }
	
	private func createAddressSuggestion(with address: String) -> ENCAddressSuggestion {
		let encAddressSuggestion = ENCAddressSuggestion(query: address)
		return encAddressSuggestion
	}
	
	
	@objc
	private func inputText(with textField: UITextField){
		self.model = .createAddress(textField.text)
	}
    
    init(with mainView: SearchAddressView) {
        self.mainView = mainView
    }
}

extension SearchAddressViewModel: UITextFieldDelegate {
	
	func textFieldDidBeginEditing(_ textField: UITextField) {
		let selector = #selector(inputText)
		textField.addTarget(self, action: selector, for: .allEvents)
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
}
