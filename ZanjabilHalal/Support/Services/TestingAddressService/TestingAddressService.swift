//
//  TestingAddressService.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 09.04.2022.
//
import Foundation

final class TestingAddressService: ServiceProtocol {
    
    public var update: ClosureAny?
    
    public func testing(with createAddressModel: CreateAddressModel) -> WarningTextType? {
        guard self.isCity(with: createAddressModel)      else { return .city     }
        guard self.isStreet(with: createAddressModel)    else { return .street   }
        guard self.isBuild(with: createAddressModel)     else { return .build    }
        guard self.isApartment(with: createAddressModel) else { return .apartment}
        guard self.isFloor(with: createAddressModel)     else { return .floor    }
        guard self.isIntercom(with: createAddressModel)  else { return .intercom }
        return nil
    }
    
    private func isCity(with createAddressModel: CreateAddressModel) -> Bool {
        return !createAddressModel.city.isEmpty
    }
    
    private func isStreet(with createAddressModel: CreateAddressModel) -> Bool {
        return !createAddressModel.street.isEmpty
    }
    
    private func isBuild(with createAddressModel: CreateAddressModel) -> Bool {
        return !createAddressModel.build.isEmpty
    }
    
    private func isApartment(with createAddressModel: CreateAddressModel) -> Bool {
        return !createAddressModel.apartment.isEmpty
    }
    
    private func isFloor(with createAddressModel: CreateAddressModel) -> Bool {
        return !createAddressModel.floor.isEmpty
    }
    
    private func isIntercom(with createAddressModel: CreateAddressModel) -> Bool {
        return !createAddressModel.intercom.isEmpty
    }
}

