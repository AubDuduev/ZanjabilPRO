//
//  AddressSuggestionsTableModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 05.06.2022.
//
import UIKit

enum AddressSuggestionsTableModel {
    
    case createViewProperties([DECAddressSuggestion])
	case createAddressForSuggestion(DECAddressSuggestion)
	case getSuggestionsAddressList
	case setCoordinateToMap(DECAddressSuggestion)
}
