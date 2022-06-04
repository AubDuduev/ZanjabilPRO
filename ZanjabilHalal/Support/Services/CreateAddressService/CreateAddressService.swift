//
//  CreateAddressService.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 09.04.2022.
//
import UIKit

final class CreateAddressService: ServiceProtocol {
    
    lazy public var createAddressModel = CreateAddressModel()
    
    public var address: ENCAddress {
        return ENCAddress(createAddressModel: self.createAddressModel)
    }
    
    public var update: ClosureAny?
    
    private var city     : String!
    private var street   : String!
    private var build    : String!
    private var apartment: String!
    private var floor    : String!
    private var intercom : String!
    
    public func createAddress(with inputText: String, with inputAddressType: InputAddressTypes) {
    
        switch inputAddressType {
            case .city:
                self.createAddressModel.city = inputText
            case .street:
                self.createAddressModel.street = inputText
            case .build:
                self.createAddressModel.build = inputText
            case .apartment:
                self.createAddressModel.apartment = inputText
            case .floor:
                self.createAddressModel.floor = inputText
            case .intercom:
                self.createAddressModel.intercom = inputText
			default:
				break
        }
        self.update?(self.createAddressModel)
    }
    
    public func setAddress(with address: DECAddress) {
        self.createAddressModel = CreateAddressModel(address: address)
    }
}
