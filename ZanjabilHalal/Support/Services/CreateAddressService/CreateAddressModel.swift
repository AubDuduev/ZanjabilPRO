//
//  CreateAddressModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 09.04.2022.
//
import Foundation

struct CreateAddressModel {
    
    var ID        = UUID().uuidString
    var build     = String()
    var city      = String()
    var apartment = String()
    var floor     = String()
    var intercom  = String()
    var street    = String()
    var isDefault = false
    
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
    
    init() {
        self.ID        = UUID().uuidString
        self.build     = String()
        self.city      = String()
        self.apartment = String()
        self.floor     = String()
        self.intercom  = String()
        self.street    = String()
        self.isDefault = false
    }
}
