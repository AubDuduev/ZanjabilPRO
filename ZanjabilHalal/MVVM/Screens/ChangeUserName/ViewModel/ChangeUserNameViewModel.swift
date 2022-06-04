//
//  ChangeUserNameViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 09.05.2022.
//
import Resolver
import UIKit

final class ChangeUserNameViewModel: NSObject, MVVMViewModelProtocol {
    
    public var model: ChangeUserNameModel? {
        didSet { self.stateModel() }
    }
    // MARK: - DI
	@Injected
	private var changeUserNameService: ChangeUserNameService
	// MARK: - Private
	private var userFirstName: String!
    // MARK: - implementation protocol
    public var mainView: ChangeUserNameViewController?
    public var isUpdate: ClosureEmpty?
    
    //MARK: - Main state view model
    private func stateModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties:
				guard let userData = changeUserNameService.getUserData() else { return }
				self.userFirstName = changeUserNameService.getName() ?? ""
				let viewProperties = ChangeUserNameViewController.ViewProperties(userData: userData,
																				 delegate: self)
				self.updateMainView(with: viewProperties)
        }
    }
	@objc
	private func changeName(with textField: UITextField){
		guard self.userFirstName != nil else { return }
		self.userFirstName = textField.text
		self.changeUserNameService.saveName(with: self.userFirstName)
	}
    
    init(with mainView: ChangeUserNameViewController) {
        self.mainView = mainView
    }
}

extension ChangeUserNameViewModel: UITextFieldDelegate {
	
	
	func textFieldDidBeginEditing(_ textField: UITextField) {
		let selector = #selector(changeName)
		textField.addTarget(self, action: selector, for: .allEvents)
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		UIApplication.shared.isHideKeyboard(show: false)
		return true
	}
}
