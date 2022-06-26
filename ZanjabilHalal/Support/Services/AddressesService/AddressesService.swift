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
    private var networkService      : NetworkService
	@Injected
	private var createAddressService: CreateAddressService
    // MARK: -
    public var subscribeAddresses      = CurrentValueSubject<[DECAddress], Never>([])
	public var subscribeDefaultAddress = CurrentValueSubject<DECAddress?, Never>(nil)
    public var update: ClosureAny?
    // MARK: - Private
    private var addresses: [DECAddress]!
    
    public func getAddresses(){
        self.networkService.requestFirebase.getUserAddresses { addresses in
            self.addresses = addresses
            self.subscribeAddresses.send(addresses)
			if let defaultAddress = self.addresses.first(where: { $0.isDefault }) {
				self.subscribeDefaultAddress.send(defaultAddress)
			}
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
	
	public func defaultAddress(completion: @escaping ClosureEmpty = {}){
		var newAddresses: [ENCAddress]
		//проверка есть ли такой адреса
		let isEquitable = self.equitable(with: self.createAddressService.address)
		let action: ActionDefaultAddress
		switch isEquitable {
			case true:
				action = ActionDefaultAddress.set(self.createAddressService.address)
			case false:
				action = ActionDefaultAddress.change(self.createAddressService.address)
		}
		switch action {
			case .change(var address):
				if let index = self.addresses.firstIndex(where: { $0.ID == address.ID }) {
					self.addresses.remove(at: index)
				}
				newAddresses = self.addresses.map { ENCAddress(address: $0, isDefault: false )}
				address.isDefault = true
				newAddresses.append(address)
			case .set(var address):
				newAddresses = self.addresses.map { ENCAddress(address: $0, isDefault: false )}
				if let index = newAddresses.firstIndex(
					where:{
						$0.apartment == address.apartment &&
						$0.street    == address.street    &&
						$0.city      == address.city      &&
						$0.floor     == address.floor     &&
						$0.intercom  == address.intercom  &&
						$0.build     == address.build
					}) {
					newAddresses[index].isDefault = true
				}
				address.isDefault = true
		}
		self.postAddresses(with: newAddresses) {
			completion()
		}
	}
    
    public func deleteAddress(with address: ENCAddress, completion: @escaping ClosureEmpty){
        self.networkService.requestFirebase.deleteAddress(body: address) { isSuccess in
            completion()
        }
    }
    
    private func equitable(with address: ENCAddress) -> Bool {
        let isEquitable = addresses.contains(where: {
            $0.apartment == address.apartment &&
            $0.street    == address.street    &&
            $0.city      == address.city      &&
            $0.floor     == address.floor     &&
            $0.intercom  == address.intercom  &&
            $0.build     == address.build
        })
        return isEquitable
    }
}

enum ActionDefaultAddress {
	case change(ENCAddress)
	case set(ENCAddress)
}
