//
//  ENCAAddress.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 03.04.2022.
//
import Foundation

struct ENCAddress: Encodable {
    
    let ID       : String
    let build    : String
    let city     : String
    let apartment: String
    let floor    : String
    let intercom : String
    let street   : String
	let latitude : String
	let longitude: String
    var isDefault: Bool
    
    
    init(createAddressModel: CreateAddressModel) {
        
        self.ID        = UUID().uuidString
        self.build     = createAddressModel.build
        self.city      = createAddressModel.city
        self.apartment = createAddressModel.apartment
        self.floor     = createAddressModel.floor
        self.intercom  = createAddressModel.intercom
        self.street    = createAddressModel.street
        self.latitude  = createAddressModel.latitude.toString
		self.longitude = createAddressModel.longitude.toString
		self.isDefault = createAddressModel.isDefault
    }
    
    init(address: DECAddress, isDefault: Bool) {
        
        self.ID        = address.ID
        self.build     = address.build
        self.city      = address.city
        self.apartment = address.apartment
        self.floor     = address.floor
        self.intercom  = address.intercom
        self.street    = address.street
        self.isDefault = isDefault
		self.latitude  = address.latitude
		self.longitude = address.longitude
    }
}
