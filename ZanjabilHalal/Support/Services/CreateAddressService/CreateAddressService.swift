//
//  CreateAddressService.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 09.04.2022.
//
import UIKit
import CoreLocation

final class CreateAddressService: ServiceProtocol {
    
    lazy public var createAddressModel = CreateAddressModel()
    
    public var address: ENCAddress {
        return ENCAddress(createAddressModel: self.createAddressModel)
    }
	
	private var addressSuggestion      : DECAddressSuggestion?
	private var yandexAddressSuggestion: DECYandexAddressSuggestion?
    
    public var update: ClosureAny?
    
    private var city      : String!
    private var street    : String!
    private var build     : String!
    private var apartment : String!
    private var floor     : String!
    private var intercom  : String!
	private var latitude  : Double!
	private var longitude : Double!
    
    public func createAddress(with inputText: String, with inputAddressType: InputAddressTypes) {
    
        switch inputAddressType {
            case .city:
                self.createAddressModel.city      = inputText
            case .street:
                self.createAddressModel.street    = inputText
            case .build:
                self.createAddressModel.build     = inputText
            case .apartment:
                self.createAddressModel.apartment = inputText
            case .floor:
                self.createAddressModel.floor     = inputText
            case .intercom:
                self.createAddressModel.intercom  = inputText
        }
        self.update?(self.createAddressModel)
    }
	
	public func createForSuggestion() {
		guard let addressSuggestionData = self.addressSuggestion?.addressData else { return }
		self.createAddressModel = CreateAddressModel(addressSuggestionData: addressSuggestionData)
	}
	
	public func createForYandexAddressSuggestion() {
		guard let yandexAddressSuggestion = self.yandexAddressSuggestion else { return }
		self.createAddressModel = CreateAddressModel(yandexAddressSuggestion: yandexAddressSuggestion)
	}
	
	public func saveAddress(with address: DECAddress) {
		self.createAddressModel = CreateAddressModel(address: address)
	}
	
	public func saveAddressSuggestion(with addressSuggestion: DECAddressSuggestion){
		self.addressSuggestion = addressSuggestion
	}
	
	public func saveYandexAddressSuggestion(with yandexAddressSuggestion: DECYandexAddressSuggestion){
		self.yandexAddressSuggestion = yandexAddressSuggestion
	}
}
