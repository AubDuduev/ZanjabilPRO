//
//  ProfileCollectionCellType.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 26.03.2022.
//
import Foundation

private typealias R = TextResources.Profile

enum ProfileCollectionCellType {
    
    case avatar
    case name(String)
    case orders(String)
    case addresses(DECAddress?)
    case card(String)
    
    public func title() -> String {
        switch self {
            case .avatar:
                return ""
            case .name:
                return R.Text.name.localizedString()
            case .orders:
                return R.Text.orders.localizedString()
            case .card:
                return R.Text.card.localizedString()
            case .addresses:
                return R.Text.addresses.localizedString()
        }
    }
    
    public func name() -> String {
        switch self {
            case .avatar:
                return ""
            case .name(let name):
                return name
            case .orders(let name):
                return name
            case .card(let name):
                return name
            case .addresses(let address):
                guard let address = address else { return "Введите аддрес" }
                let addressName = "\(address.street) \(address.build), \(address.apartment)"
                return addressName
        }
    }
}
