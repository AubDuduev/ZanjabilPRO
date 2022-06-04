//
//  AddressSuggestionsCollectionView.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 29.05.2022.
//
import UIKit

final class AddressSuggestionsCollectionView: UIView, MVVMViewProtocol {
    
    struct ViewProperties {
       
		let collectionCells      : Int
		let decAddressSuggestions: [DECAddressSuggestion]
    }
    var viewProperties: ViewProperties?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let collection = AddressSuggestionsCollection()
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
		self.collection.update(with: viewProperties)
        self.setupCollectionView()
    }
    private func setupCollectionView() {
        let collectionViewLayout                           = AddressSuggestionsCollectionViewLayout()
        collectionViewLayout.sectionInset                  = .init(top: 0, left: 0, bottom: 0, right: 0)
        collectionViewLayout.sectionInsetReference         = .fromContentInset
        collectionViewLayout.minimumLineSpacing            = 0
        collectionViewLayout.minimumInteritemSpacing       = 0
        collectionViewLayout.scrollDirection               = .horizontal
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.collectionViewLayout           = collectionViewLayout
        self.collectionView.delegate                       = self.collection
        self.collectionView.dataSource                     = self.collection
        self.collectionView.reloadData()
    }
    
    // MARK: - create view
    static func create() -> AddressSuggestionsCollectionView {
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first as! AddressSuggestionsCollectionView
        return view
    }
}
