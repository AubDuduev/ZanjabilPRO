//
//  AddressSuggestionTableCell.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 05.06.2022.
//
import UIKit

final class AddressSuggestionTableCell: UITableViewCell, MVVMViewProtocol {
	
	struct ViewProperties {
		let addressSuggestion: DECAddressSuggestion
	}
	var viewProperties: ViewProperties?
	
	@IBOutlet weak private var fullAddressSuggestionLabel: UILabel!
	
	func create(with viewProperties: ViewProperties?) {
		self.viewProperties = viewProperties
	}
	
	func update(with viewProperties: ViewProperties?) {
		self.viewProperties = viewProperties
		self.setData()
	}
	
	private func setData(){
		self.fullAddressSuggestionLabel.text = self.viewProperties?.addressSuggestion.fullAddress
	}
	
	static func create() -> Self {
		let nib = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first
		return nib as! Self
	}
}
