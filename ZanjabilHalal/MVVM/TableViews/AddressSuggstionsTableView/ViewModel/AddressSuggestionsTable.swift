//
//  AddressSuggestionsTable.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 05.06.2022.
//
import UIKit

final class AddressSuggestionsTable: NSObject {
	
	public var viewModel: AddressSuggestionsViewModel?
	public var tableView: UITableView!
	
}
//MARK: - Delegate
extension AddressSuggestionsTable: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
	}
}
//MARK: - DataSources
extension AddressSuggestionsTable: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = AddressSuggestionsTableCell().tableCell()
		cell.configure(viewModel: self.viewModel)
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		
		return 50
	}
}
