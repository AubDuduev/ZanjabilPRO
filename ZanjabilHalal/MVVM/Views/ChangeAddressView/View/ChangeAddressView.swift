//
//  ChangeAddressView.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 04.06.2022.
//
import UIKit

final class ChangeAddressView: UIView, MVVMViewProtocol {
    
    struct ViewProperties {
		var currentAddress          : String?
		let didTapSearchAddress     : ClosureEmpty
		let addAddressCollectionView: Closure<UIView>
    }
    var viewProperties: ViewProperties?
	
	private var isLoad = false
	
	@IBOutlet weak private var containerAddressesCollectionView: UIView!
	@IBOutlet weak private var currentAddressTextField         : UITextField!
	
	func create(with viewProperties: ViewProperties?) {
		self.viewProperties = viewProperties
		self.setCurrentAddress()
		self.viewProperties?.addAddressCollectionView(self.containerAddressesCollectionView)
		self.setup()
	}
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
		self.setCurrentAddress()
    }
	
	private func setCurrentAddress(){
		self.currentAddressTextField.text = self.viewProperties?.currentAddress
	}
	
	private func setup(){
		self.cornerRadius(radius       : 16,
						  direction    : .top,
						  clipsToBounds: true)
	}
	
	@IBAction func didTapSearchAddressGesture(gesture: UITapGestureRecognizer){
		self.viewProperties?.didTapSearchAddress()
	}
	
	@IBAction func didTapSearchAddressButton(button: UIButton){
		self.viewProperties?.didTapSearchAddress()
	}
    // MARK: - create view
    static func create() -> ChangeAddressView {
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first as! ChangeAddressView
        return view
    }
}
