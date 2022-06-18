//
//  AddressesCollectionView.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 23.04.2022.
//
import UIKit

final class AddressesCollectionView: UIView, MVVMViewProtocol {
    
    struct ViewProperties {
		let addressCollectionType: AddressCollectionType
        let addresses            : [DECAddress]
    }
    var viewProperties: ViewProperties?
    
    private let collection = AddressesCollection()
    
    @IBOutlet weak private var collectionView: UICollectionView!
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.collection.update(with: viewProperties)
        self.setupCollectionView()
    }
    
    private func setupCollectionView() {
        let collectionViewLayout                           = AddressesCollectionViewLayout()
        collectionViewLayout.sectionInset                  = .init(top: 0, left: 0, bottom: 0, right: 0)
        collectionViewLayout.sectionInsetReference         = .fromContentInset
        collectionViewLayout.minimumLineSpacing            = 0
        collectionViewLayout.minimumInteritemSpacing       = 8
        collectionViewLayout.scrollDirection               = .horizontal
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.collectionViewLayout           = collectionViewLayout
        self.collectionView.delegate                       = self.collection
        self.collectionView.dataSource                     = self.collection
        self.collectionView.reloadData()
    }

    @IBAction func didTapGesture(gesture: UITapGestureRecognizer){
        self.endEditing(true)
    }
    // MARK: - create view
    static func create() -> AddressesCollectionView {
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first as! AddressesCollectionView
        return view
    }
}
