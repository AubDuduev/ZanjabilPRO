//
//  MenuCollectionView.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 10.04.2022.
//
import Foundation
import UIKit

final class MenuCollectionView: UIView, MVVMViewProtocol {
    
    struct ViewProperties {
        let menuList          : [DECMenu]
        var menuState         : MenuState
        let countSection      : Int
		var toScrollToCategory: Closure<DECCategory?>
    }
    var viewProperties: ViewProperties?
   
    @IBOutlet weak var menuCollectionView: UICollectionView!
    private var menuCollection       = MenuCollection()
    private let collectionViewLayout = MenuCollectionViewLayout()
   
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.menuCollection.update(with: viewProperties)
		self.setupScrollToCategory()
        self.setupMenuCollection()
        self.setupMenuCollectionView()
    }
	private func setupScrollToCategory(){
		guard let viewProperties = self.viewProperties else { return }
		self.viewProperties?.toScrollToCategory = { category in
			if let category = category {
				guard let index = viewProperties.menuList.firstIndex(where: { $0.category?.name == category.name }) else { return }
				let indexPath = IndexPath(item: 0, section: index)
				self.menuCollectionView.scrollToItem(at: indexPath, at: .top, animated: true)
			}
		}
	}
    private func setupMenuCollectionView(){
        guard let viewProperties = self.viewProperties else { return }
        self.collectionViewLayout.sectionInset                 = viewProperties.menuState.sectionInset()
        self.collectionViewLayout.sectionInsetReference        = .fromContentInset
        self.collectionViewLayout.minimumLineSpacing           = viewProperties.menuState.minimumLineSpacing()
        self.collectionViewLayout.minimumInteritemSpacing      = viewProperties.menuState.minimumInteritemSpacing()
        self.collectionViewLayout.scrollDirection              = viewProperties.menuState.scrollDirection()
        self.menuCollectionView.collectionViewLayout           = self.collectionViewLayout
        self.menuCollectionView.isPagingEnabled                = viewProperties.menuState.isPagingEnabled()
        self.menuCollectionView.showsVerticalScrollIndicator   = false
        self.menuCollectionView.showsHorizontalScrollIndicator = false
        self.menuCollectionView.reloadData()
    }
    private func setupMenuCollection(){
        self.menuCollectionView.delegate   = self.menuCollection
        self.menuCollectionView.dataSource = self.menuCollection
    }
    
    
    // MARK: - create view
    static func create() -> MenuCollectionView {
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first as! MenuCollectionView
        return view
    }
}
