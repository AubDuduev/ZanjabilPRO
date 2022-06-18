//
//  AddressSuggestionCollectionCell.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 29.05.2022.
//
import UIKit

final class AddressSuggestionCollectionCell: UICollectionViewCell, LoadNidoble, MVVMViewProtocol {
    
    struct ViewProperties {
		let addressSuggestion: DECAddressSuggestion
    }
    var viewProperties: ViewProperties?
	
	@IBOutlet weak private var fullAddressSuggestionLabel: UILabel!
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
		self.setData()
    }
	private func setData(){
		self.fullAddressSuggestionLabel.text = self.viewProperties?.addressSuggestion.fullAddress
	}
    // MARK: - create cell
    static func create(with collection: UICollectionView, with indexPath: IndexPath) -> AddressSuggestionCollectionCell {
        let nib = UINib(nibName: String(describing: Self.self), bundle: nil)
        collection.register(nib, forCellWithReuseIdentifier: String(describing: Self.self))
        let cell = collection.dequeueReusableCell(withReuseIdentifier: String(describing: Self.self), for: indexPath) as! AddressSuggestionCollectionCell
        return cell
    }
}
