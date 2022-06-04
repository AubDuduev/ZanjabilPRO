//
//  MenuCollectionViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 10.04.2022.
//
import Resolver
import UIKit
import Combine

final class MenuCollectionViewModel: MVVMViewModelProtocol {
    
    public var model: MenuCollectionModel? {
        didSet { self.logicMenuCollectionModel() }
    }
    //MARK: - View
    public var mainView: MenuCollectionView?
    public var isUpdate: ClosureEmpty?
    //DI
    @Injected
    private var menuService                 : MenuService
    @Injected
    private var localBasketService          : LocalBasketService
	@Injected
	private var changeCurrentCategoryService: ChangeCurrentCategoryService
    // MARK: - Private
    private let menuCollection = MenuCollection()
    private var cancellable    : Set<AnyCancellable> = []
    private var listMenu       : [DECMenu] = []
	
	private func logicMenuCollectionModel(){
		guard let model = self.model else { return }
		switch model {
			case .createViewProperties:
				self.changeCurrentCategoryService.subscribeUpdateState
					.sink(receiveValue: { didTapIndexPath in
					guard let category = self.listMenu[didTapIndexPath.row].category else { return }
					self.model = .scrollToCategory(category)
				}).store(in: &self.cancellable)
				let countSection   = 0
				let viewProperties = MenuCollectionView.ViewProperties(menuList          : [],
																	   menuState         : .vertical,
																	   countSection      : countSection,
																	   toScrollToCategory: { _ in })
				self.mainView?.update(with: viewProperties)
			case .updateViewProperties(let menuList, let menuState):
				//set state category first
				self.changeCurrentCategoryService.setFirst(with: menuList)
				
				let countSection   = menuList.count
				let viewProperties = MenuCollectionView.ViewProperties(menuList          : menuList,
																	   menuState         : menuState,
																	   countSection      : countSection,
																	   toScrollToCategory: { _ in } )
				self.mainView?.update(with: viewProperties)
			case .switchMenuState(let menuState):
				self.mainView?.viewProperties?.menuState = menuState
				self.model = .updateViewProperties(listMenu: self.listMenu, menuState: menuState)
				self.mainView?.update(with: self.mainView?.viewProperties)
			case .scrollToCategory(let category):
				self.mainView?.viewProperties?.toScrollToCategory(category)
				// MARK: - Server
			case .getMenu:
                self.menuService.subscribeUpdateMenu
                    .sink { [weak self] listMenu in
                    guard let self = self else { return }
                    self.listMenu = listMenu
                    let menuState = self.mainView?.viewProperties?.menuState ?? .vertical
                    self.model    = .updateViewProperties(listMenu: listMenu, menuState: menuState)
                }
                .store(in: &self.cancellable)
                self.menuService.getMenu()
        }
    }
	
    init(with mainView: MenuCollectionView) {
        self.mainView = mainView
    }
}
