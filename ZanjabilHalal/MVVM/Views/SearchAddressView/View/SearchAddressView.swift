//
//  SearchAddressView.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 29.05.2022.
//
import UIKit

final class SearchAddressView: UIView, MVVMViewProtocol {
    
    struct ViewProperties {
       
		let searchTextFieldDelegate: UITextFieldDelegate
    }
    var viewProperties: ViewProperties?
	
	@IBOutlet weak private var searchTextField: UITextField!
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
		self.setupSearchTextField()
		
    }
	
	private func setupSearchTextField(){
		searchTextField.delegate = self.viewProperties?.searchTextFieldDelegate
	}
    // MARK: - create view
    static func create() -> SearchAddressView {
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first as! SearchAddressView
        return view
    }
}
