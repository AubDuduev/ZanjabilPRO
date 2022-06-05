//
//  AddressSuggestionsTable.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 05.06.2022.
//
import Resolver
import UIKit

final class AddressSuggestionsTable: NSObject {
	
	@Injected
	private var mainTableCellBuilder: MainTableCellBuilder
	
	private var viewProperties: AddressSuggestionsTableView.ViewProperties?
	
	func update(with viewProperties: AddressSuggestionsTableView.ViewProperties?) {
		self.viewProperties = viewProperties
	}
	
}
//MARK: - Delegate
extension AddressSuggestionsTable: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
	}
}
//MARK: - DataSources
extension AddressSuggestionsTable: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.viewProperties?.countCells ?? 0
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let addressSuggestion = self.viewProperties!.decAddressSuggestions[indexPath.row]
		let addressSuggestionTableCellBuilder = self.mainTableCellBuilder.createAddressSuggestionTableCellBuilder()
		addressSuggestionTableCellBuilder.viewModel.model = .createViewProperties(addressSuggestion)
		return addressSuggestionTableCellBuilder.view
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return tableView.estimatedRowHeight
	}
}
