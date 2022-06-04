//
//  ChangeUserNameViewController.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 09.05.2022.
//
import UIKit

final class ChangeUserNameViewController: UIViewController, MVVMViewProtocol {
    
    //MARK: - Main ViewProperties
    struct ViewProperties {
		public let userData: UserData
		public let delegate: UITextFieldDelegate

    }
    var viewProperties: ViewProperties?
    
    //MARK: - Outlets
	@IBOutlet weak private var userNameTextField: UITextField!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
	private func setupTextField(){
		self.userNameTextField.delegate = self.viewProperties?.delegate
	}
	private func setUserName(){
		self.userNameTextField.text = self.viewProperties?.userData.firstName
		self.userNameTextField.becomeFirstResponder()
	}
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
		self.setUserName()
		self.setupTextField()
    }
    
    init() {
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
