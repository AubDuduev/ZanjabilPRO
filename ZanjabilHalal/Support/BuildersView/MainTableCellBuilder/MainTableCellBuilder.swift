//
//  MainTableCellBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 05.06.2022.
//
import Foundation

final class MainTableCellBuilder {
	
	public func createAddressSuggestionTableCellBuilder() -> AddressSuggestionTableCellBuilder {
		let addressSuggestionTableCellBuilder = AddressSuggestionTableCellBuilder.create()
		return addressSuggestionTableCellBuilder
	}
}
