//
//  AddressSuggestionsTableView.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 05.06.2022.
//
import UIKit

final class AddressSuggestionsTableView: UIView, MVVMViewProtocol {
	
	struct ViewProperties {
		let didSelectRowAt       : Closure<IndexPath>
		let countCells           : Int
		let decAddressSuggestions: [DECAddressSuggestion]
	}
	var viewProperties: ViewProperties?
	
	@IBOutlet weak private var tableView: UITableView!
	
	private let table = AddressSuggestionsTable()
	
	func update(with viewProperties: ViewProperties?) {
		self.viewProperties = viewProperties
		self.table.update(with: self.viewProperties)
		self.setupTableView()
	}
	
	func create(with viewProperties: ViewProperties?) {
		self.viewProperties = viewProperties
		self.setupTableView()
	}
	
	private func setupTableView() {
		self.tableView.delegate   = self.table
		self.tableView.dataSource = self.table
		self.tableView.reloadData()
	}
	
	// MARK: - create view
	static func create() -> AddressSuggestionsTableView {
		let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first as! AddressSuggestionsTableView
		return view
	}
}
