//
//  MenuCategoriesViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 10.04.2022.
//
import UIKit
import Resolver
import Combine

final class MenuCategoriesViewModel: MVVMViewModelProtocol {
    
    public var model: MenuCategoriesModel? {
        didSet { self.logicCategoryMenuModel() }
    }
    //MARK: - View
    public var mainView: MenuCategoriesView?
    public var isUpdate: ClosureEmpty?
	//DI
    @Injected
    private var menuService                 : MenuService
	@Injected
	private var changeCurrentCategoryService: ChangeCurrentCategoryService
    @Injected
    private var localBasketService          : LocalBasketService
    // MARK: - Private
    private var cancellable: Set<AnyCancellable> = []
    
    private func logicCategoryMenuModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties(let categories):
				self.changeCurrentCategoryService.subscribeUpdateState
					.sink(receiveValue: { didTapIndexPath in
						self.model = .updateDidTapCell(didTapIndexPath)
					}).store(in: &self.cancellable)
				
				let viewProperties = MenuCategoriesView.ViewProperties(categories      : categories,
																	   updateDidTapCell: { _ in })
                self.mainView?.update(with: viewProperties)
			case .updateDidTapCell(let didTapIndexPath):
				self.mainView?.viewProperties?.updateDidTapCell?(didTapIndexPath)
            case .getMenu:
                self.menuService.subscribeUpdateMenu
                    .removeDuplicates()
                    .sink { [weak self] listMenu in
                    guard let self = self else { return }
                    let categories = listMenu.compactMap{ $0.category }
                    self.model = .createViewProperties(categories)
                }
                .store(in: &self.cancellable)
        }
    }
   
    init(with mainView: MenuCategoriesView) {
        self.mainView = mainView
    }
}
