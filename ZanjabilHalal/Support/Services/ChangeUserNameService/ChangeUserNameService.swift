//
//
//  ChangeUserNameService.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 09.05.2022.
//
//
import UIKit
import Combine
import Resolver

final class ChangeUserNameService: ServiceProtocol {
  
	private var userData: UserData?
	
    public var updateUserName = PassthroughSubject<String, Never>()
	// MARK: - DI
	@Injected
	private var coreDataService: CoreDataService
	
	public func getUserData() -> UserData? {
		if let userData = self.coreDataService.fetch(object: UserData.self) {
			self.userData = userData
			return self.userData
		} else {
			self.userData = self.coreDataService.create(object: UserData.self)
			return self.userData
		}
	}
	
	public func getName() -> String? {
		if let userData = self.coreDataService.fetch(object: UserData.self) {
			self.userData = userData
			return self.userData?.firstName
		} else {
			self.userData = self.coreDataService.create(object: UserData.self)
			return self.userData?.firstName
		}
	}
	
	public func saveName(with name: String){
		self.userData?.firstName = name
		self.coreDataService.edit()
		self.updateUserName.send(name)
	}
	
	private func changeName(with name: String){
		
	}
}
