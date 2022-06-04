//
//  MenuCategoriesView.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 10.04.2022.
//
import UIKit

final class MenuCategoriesView: UIView, MVVMViewProtocol {
    
    struct ViewProperties {
		let categories      : [DECCategory]
		var updateDidTapCell: Closure<IndexPath>?
    }
    var viewProperties: ViewProperties?
    // MARK: - Outlet
    @IBOutlet weak private var collectionView: UICollectionView!
	// MARK: - Private
	private let menuCategoriesCollection = MenuCategoriesCollection()
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
		self.updateVisibleCells()
		self.setupCollectionView()
		self.menuCategoriesCollection.update(with: viewProperties)
    }
	// MARK: -
	private func updateVisibleCells() {
		self.viewProperties?.updateDidTapCell = { indexPath in
			guard let visibleCells = self.collectionView.visibleCells as? [DishCategoryCollectionCell] else { return }
			let indexPaths = visibleCells.compactMap { self.collectionView.indexPath(for: $0) }
			self.collectionView.reloadItems(at: indexPaths)
		}
	}
	private func setupCollectionView() {
		let collectionViewLayout                           = MenuCategoriesCollectionViewLayout()
		collectionViewLayout.sectionInset                  = .init(top: 0, left: 0, bottom: 0, right: 0)
		collectionViewLayout.sectionInsetReference         = .fromContentInset
		collectionViewLayout.minimumLineSpacing            = 0
		collectionViewLayout.minimumInteritemSpacing       = 8
		collectionViewLayout.scrollDirection               = .horizontal
		self.collectionView.showsHorizontalScrollIndicator = false
		self.collectionView.collectionViewLayout           = collectionViewLayout
		self.collectionView.delegate                       = self.menuCategoriesCollection
		self.collectionView.dataSource                     = self.menuCategoriesCollection
		self.collectionView.reloadData()
	}
    // MARK: - create view
    static func create() -> MenuCategoriesView {
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first as! MenuCategoriesView
        return view
    }
}
