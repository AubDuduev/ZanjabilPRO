//
//  ProfileCollectionView.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 22.04.2022.
//
import UIKit

final class ProfileCollectionView: UIView, MVVMViewProtocol {
    
    struct ViewProperties {
        let profileCollectionCells: [ProfileCollectionCellType]
		var updateRow             : Closure<IndexPath>
    }
    var viewProperties: ViewProperties?
    
    private let profileCollection    = ProfileCollection()
    private let collectionViewLayout = ProfileCollectionViewLayout()
	
    @IBOutlet weak private var collectionView: UICollectionView!
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.profileCollection.viewProperties = viewProperties
        self.setupProfileCollection()
        self.setupProfileCollectionView()
		self.setupUpdateRow()
    }
	
	private func setupUpdateRow(){
		self.viewProperties?.updateRow = { [weak self] indexPath in
			guard let self = self else { return }
			self.collectionView.reloadItems(at: [indexPath])
		}
	}
    
    private func setupProfileCollectionView(){
        self.collectionViewLayout.sectionInset             = .init(top: 32, left: 0, bottom: 0, right: 0)
        self.collectionViewLayout.sectionInsetReference    = .fromContentInset
        self.collectionViewLayout.minimumLineSpacing       = 0
        self.collectionViewLayout.minimumInteritemSpacing  = 0
        self.collectionViewLayout.scrollDirection          = .vertical
        self.collectionView.collectionViewLayout           = self.collectionViewLayout
        self.collectionView.isPagingEnabled                = false
        self.collectionView.showsVerticalScrollIndicator   = false
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.reloadData()
    }
    
    private func setupProfileCollection(){
        self.collectionView.delegate   = self.profileCollection
        self.collectionView.dataSource = self.profileCollection
    }
    
    // MARK: - create view
    static func create() -> ProfileCollectionView {
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first as! ProfileCollectionView
        return view
    }
}
