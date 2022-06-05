//
//  AddressSuggestionTableCell.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 05.06.2022.
//
import UIKit

final class AddressSuggestionTableCell: UITableViewCell {
	
	
	struct ViewProperties {
		
	}
	var viewProperties: ViewProperties?
	
	func create(with viewProperties: ViewProperties?) {
		self.viewProperties = viewProperties
	}
	
	func update(with viewProperties: ViewProperties?) {
		self.viewProperties = viewProperties
	}
	
	func create() -> Self {
		let nib = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first
		return nib as! Self
	}
}
