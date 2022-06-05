//
//  BasketCollectionViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 16.04.2022.
//
import Resolver
import UIKit
import Combine

final class BasketCollectionViewModel: MVVMViewModelProtocol {
    
    public var model: BasketCollectionModel? {
        didSet { self.stateBasketModel() }
    }
    
    //MARK: - implementation protocol
    public var mainView: BasketCollectionView?
    public var isUpdate: ClosureEmpty?
    //DI
    @Injected
    private var mainCellsBuilder  : MainCollectionCellsBuilder
    @Injected
    private var menuService       : MenuService
    @Injected
    private var localBasketService: LocalBasketService
    // MARK: - Private
    private let collection = BasketCollection()
    private var cancellable: Set<AnyCancellable> = []
    
    //MARK: - Main state view model
    private func stateBasketModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties(let listMenu):
                self.setupCollectionView()
                var allDishes = listMenu.compactMap{ $0.dishes }.flatMap{ $0 }
                let products  = localBasketService.getProducts()
                allDishes = allDishes.filter({ dish in
                    return products.contains(where: { (dish.ID! == $0.id!) && ($0.count != 0) } )
                })
                let collectionCells = self.createVerticalDishCollectionCells(with: allDishes)
                let viewProperties  = BasketCollection.ViewProperties(collectionCells: collectionCells)
                self.collection.update(with: viewProperties)
                self.mainView!.collectionView.reloadData()
            case .getMenu:
                self.menuService.subscribeUpdateMenu
                    .sink { [weak self] listMenu in
                    guard let self = self else { return }
                    self.model = .createViewProperties(listMenu)
                }
                .store(in: &self.cancellable)
        }
    }
    
    private func createVerticalDishCollectionCells(with allDishes: [DECDish]) -> [VerticalDishCollectionCell] {
        let verticalCells = allDishes.enumerated().map { index, dish in
            self.createVerticalDishCollectionCell(with: index, with: dish)
        }
        return verticalCells
    }
    
    private func createVerticalDishCollectionCell(with index: Int, with dish: DECDish) -> VerticalDishCollectionCell {
        let indexPath = IndexPath(row: index, section: 0)
        let collectionCellBuilder = self.mainCellsBuilder.createVerticalDishCollectionCellBuilder(with: self.mainView!.collectionView, with: indexPath)
        collectionCellBuilder.viewModel.model = .createViewProperties(dish)
        return collectionCellBuilder.view
    }
    
    private func setupCollectionView() {
        let collectionViewLayout                                     = BasketCollectionViewLayout()
        collectionViewLayout.sectionInset                            = .init(top: 16, left: 8, bottom: 8, right: 8)
        collectionViewLayout.sectionInsetReference                   = .fromContentInset
        collectionViewLayout.minimumLineSpacing                      = 8
        collectionViewLayout.minimumInteritemSpacing                 = 0
        collectionViewLayout.scrollDirection                         = .vertical
        self.mainView?.collectionView.showsHorizontalScrollIndicator = false
        self.mainView?.collectionView.collectionViewLayout           = collectionViewLayout
        self.mainView?.collectionView.delegate                       = self.collection
        self.mainView?.collectionView.dataSource                     = self.collection
    }
    
    
    init(with mainView: BasketCollectionView) {
        self.mainView = mainView
    }
}
