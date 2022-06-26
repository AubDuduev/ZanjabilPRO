//
//  CreateAddressModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 09.04.2022.
//
import Foundation

struct CreateAddressModel {
    
    var ID         = UUID().uuidString
    var build      = String()
    var city       = String()
    var apartment  = String()
    var floor      = String()
    var intercom   = String()
    var street     = String()
	var latitude   : Double = 0
	var longitude  : Double = 0
    var isDefault  = false
    
    init(address: DECAddress) {
        
        self.ID        = address.ID
        self.build     = address.build
        self.city      = address.city
        self.apartment = address.apartment
        self.floor     = address.floor
        self.intercom  = address.intercom
        self.street    = address.street
        self.isDefault = address.isDefault
    }
	
	init(address: ENCAddress) {
		
		self.ID        = address.ID
		self.build     = address.build
		self.city      = address.city
		self.apartment = address.apartment
		self.floor     = address.floor
		self.intercom  = address.intercom
		self.street    = address.street
		self.isDefault = address.isDefault
	}
	
	init(addressSuggestionData: DECAddressSuggestionData) {
		
		self.ID        = UUID().uuidString
		self.build     = ""
		self.city      = addressSuggestionData.city ?? ""
		self.apartment = ""
		self.floor     = ""
		self.intercom  = ""
		self.street    = addressSuggestionData.street ?? ""
		self.isDefault = true
	}
	
	init(yandexAddressSuggestion: DECYandexAddressSuggestion) {
		
		self.ID         = UUID().uuidString
		self.build      = yandexAddressSuggestion.build ?? ""
		self.city       = yandexAddressSuggestion.city  ?? ""
		self.apartment  = ""
		self.floor      = ""
		self.intercom   = ""
		self.street     = yandexAddressSuggestion.street ?? ""
		self.longitude  = yandexAddressSuggestion.coordinate?.longitude ?? 0
		self.latitude   = yandexAddressSuggestion.coordinate?.latitude  ?? 0
		self.isDefault  = true
	}
    
    init() {
        self.ID        = UUID().uuidString
        self.build     = String()
        self.city      = String()
        self.apartment = String()
        self.floor     = String()
        self.intercom  = String()
        self.street    = String()
        self.isDefault = true
    }
}
