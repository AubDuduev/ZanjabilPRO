//
//
//  AddressesService.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 30.04.2022.
//
//
import Combine
import Resolver
import UIKit

final class AddressesService: ServiceProtocol {
  
    // MARK: - DI
    @Injected
    private var networkService : NetworkService
    // MARK: -
    public var subscribeUpdate = CurrentValueSubject<[DECAddress], Never>([])
    public var update: ClosureAny?
    // MARK: - Private
    private var addresses: [DECAddress]!
    
    public func getAddresses(){
        self.networkService.requestFirebase.getUserAddresses { addresses in
            self.addresses = addresses
            self.subscribeUpdate.send(addresses)
        }
    }
    
    public func postAddress(with address: ENCAddress, completion: @escaping ClosureEmpty){
        self.networkService.requestFirebase.postAddress(body: address) { isSuccess in
            guard isSuccess else { return }
            completion()
        }
    }
    
    public func postAddresses(with addresses: [ENCAddress], completion: @escaping ClosureEmpty){
        self.networkService.requestFirebase.postAddresses(body: addresses) { isSuccess in
            guard isSuccess else { return }
            completion()
        }
    }
    
    public func changeDefaultAddress(with address: ENCAddress, completion: @escaping ClosureEmpty = {}){
        if let index = self.addresses.firstIndex(where: { $0.ID == address.ID }) {
            self.addresses.remove(at: index)
        }
        var encAddresses = self.addresses.map { ENCAddress(address: $0, isDefault: false )}
        encAddresses.append(address)
        self.postAddresses(with: encAddresses) {
            completion()
        }
    }
    
    public func deleteAddress(with address: ENCAddress, completion: @escaping ClosureEmpty){
        self.networkService.requestFirebase.deleteAddress(body: address) { isSuccess in
            completion()
        }
    }
    
    public func equitable(with address: ENCAddress) -> Bool {
        let isEquitable = addresses.contains(where: {
            $0.apartment == address.apartment &&
            $0.street    == address.street &&
            $0.city      == address.city &&
            $0.floor     == address.floor &&
            $0.intercom  == address.intercom &&
            $0.build     == address.build
        })
        return isEquitable
    }
}
