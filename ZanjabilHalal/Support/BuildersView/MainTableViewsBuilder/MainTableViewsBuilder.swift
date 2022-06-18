//
//  MainTableViewsBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 05.06.2022.
//
import Foundation

final class MainTableViewsBuilder {
	
	public func createAddressSuggestionsTableViewBuilder() -> AddressSuggestionsTableViewBuilder {
		let addressSuggestionsTableViewBuilder = AddressSuggestionsTableViewBuilder.create()
		addressSuggestionsTableViewBuilder.viewModel.model = .createViewProperties([])
		return addressSuggestionsTableViewBuilder
	}
}
