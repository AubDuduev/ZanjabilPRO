//
//  DishCategoryViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 10.04.2022.
//
import Foundation
import Resolver

final class DishCategoryViewModel: MVVMViewModelProtocol {
    
    public var model: DishCategoryModel? {
        didSet { self.logicMenuCategoryModel() }
    }
	//DI
	@Injected
	private var changeCurrentCategoryService: ChangeCurrentCategoryService
	@Injected
	private var feedbackGeneratorService    : FeedbackGeneratorService
    //MARK: - View
    public var mainView: DishCategoryCollectionCell?
    public var isUpdate: ClosureEmpty?
    
    private func logicMenuCategoryModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties(let category, let indexPath):
				let categoryState  = changeCurrentCategoryService.get(with: category)
				let didTapCategory: ClosureTwo<DECCategory, IndexPath> = { category, indexPath in
					self.changeCurrentCategoryService.set(with: category, indexPath: indexPath)
					self.feedbackGeneratorService.vibration()
				}
				//self.changeCurrentCategoryService.set(with: category, indexPath: indexPath)
				let viewProperties = DishCategoryCollectionCell.ViewProperties(category      : category,
																			   didTapCategory: didTapCategory,
																			   indexPath     : indexPath,
																			   categoryState : categoryState)
                self.mainView?.update(with: viewProperties)
            case .updateViewProperties:
                print("") 
        }
    }
    
    init(with mainView: DishCategoryCollectionCell) {
        self.mainView = mainView
    }
}
