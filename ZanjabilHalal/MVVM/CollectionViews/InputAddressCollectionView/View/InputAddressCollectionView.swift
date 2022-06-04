//
//  InputAddressCollectionView.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 16.04.2022.
//
import UIKit

final class InputAddressCollectionView: UIView, MVVMViewProtocol {
    
    struct ViewProperties {
        let inputAddressTypes : [InputAddressTypes]
        let address           : DECAddress?
    }
    var viewProperties: ViewProperties?
    
    @IBOutlet weak private var collectionView: UICollectionView!
    
    //MARK: - Private
    private let collection = InputAddressCollection()
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.collection.update(with: viewProperties)
        self.setupCollectionView()
        self.collectionView.reloadData()
    }
    
    private func setupCollectionView() {
        let collectionViewLayout                           = InputAddressCollectionViewLayout()
        collectionViewLayout.sectionInset                  = .init(top: 0, left: 8, bottom: 0, right: 8)
        collectionViewLayout.sectionInsetReference         = .fromContentInset
        collectionViewLayout.minimumLineSpacing            = 8
        collectionViewLayout.minimumInteritemSpacing       = 8
        collectionViewLayout.scrollDirection               = .vertical
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.collectionViewLayout           = collectionViewLayout
        self.collectionView.delegate                       = self.collection
        self.collectionView.dataSource                     = self.collection
    }
    
    @IBAction func didTapGesture(gesture: UITapGestureRecognizer){
        self.endEditing(true)
    }
    // MARK: - create view
    static func create() -> InputAddressCollectionView {
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first as! InputAddressCollectionView
        return view
    }
}
