//
//  InputAddressViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 16.04.2022.
//
import UIKit
import Resolver

final class InputAddressCellViewModel: NSObject, MVVMViewModelProtocol {
    
    public var model: InputAddressCellModel? {
        didSet { self.stateInputAddressModel() }
    }
    //MARK: - implementation protocol
    public var mainView: InputAddressCollectionCell?
    public var isUpdate: ClosureEmpty?
    //DI
    @Injected
    private var createAddressService: CreateAddressService
    @Injected
    private var mainRouter          : MainRouter
    // MARK: - Private
    private var inputTextField: UITextField!
    // MARK: - Main state view model
    private func stateInputAddressModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties(let inputAddressType):
                let didTapAction : Closure<InputAddressTypes> = { inputAddressTypes in
                    switch inputAddressTypes {
                        case .city:
                            self.mainRouter.pushMainNavigation(id: .addressesVC, animated: true)
                            self.mainRouter.setupMainNavigationVC(isNavigationBarHidden: false, animatedHidden: true, tintColor: .set(.greenFore))
                        default:
                            break
                    }
                }
                let viewProperties = InputAddressCollectionCell.ViewProperties(inputAddressType: inputAddressType,
                                                                               typedText       : nil,
                                                                               delegate        : self,
                                                                               isHiddenAction  : inputAddressType.isHiddenAction(),
                                                                               didTapAction    : didTapAction)
                self.mainView?.update(with: viewProperties)
            case .createAddress(let inputText):
                guard let inputAddressType = self.mainView?.viewProperties?.inputAddressType else { return }
                guard let inputText = inputText else { return }
				self.createAddressService.createAddress(with: inputText,
														with: inputAddressType)
        }
    }
    
    @objc
    private func inputText(){
        self.model = .createAddress(inputTextField.text)
    }
	
    init(with mainView: InputAddressCollectionCell) {
        self.mainView = mainView
    }
}
extension InputAddressCellViewModel: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.inputTextField = textField
        let selector = #selector(inputText)
        self.inputTextField.addTarget(self, action: selector, for: .allEvents)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        UIApplication.shared.isHideKeyboard(show: false)
        return true
    }
}
