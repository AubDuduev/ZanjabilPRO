//
//  StartLoadingViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 02.05.2022.
//
import SkeletonView
import UIKit

final class StartLoadingViewModel: MVVMViewModelProtocol {
    
    public var model: StartLoadingModel? {
        didSet { self.stateStartLoadingModel() }
    }
    
    //MARK: - implementation protocol
    public var mainView: StartLoadingView?
    public var isUpdate: ClosureEmpty?
    
    //MARK: - Main state view model
    private func stateStartLoadingModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties:
                
                let loadingCategoryItems: Closure<[UIView]> = { categoryItems in
                    categoryItems.forEach { categoryItem in
                        categoryItem.isSkeletonable = true
                        categoryItem.cornerRadius(8, true)
                        let animation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: .topLeftBottomRight)
                        categoryItem.showAnimatedGradientSkeleton(animation: animation)
                    }
                }
                let loadingLoadingCells: Closure<[UIView]> = { loadingCells in
                    loadingCells.forEach { loadingCell in
                        loadingCell.isSkeletonable = true
                        loadingCell.cornerRadius(60, true)
                        let animation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: .topLeftBottomRight)
                        loadingCell.showAnimatedGradientSkeleton(animation: animation)
                    }
                }
                let loadingTabItems: Closure<[UIView]> = { tabItems in
                    tabItems.forEach { tabItem in
                        tabItem.isSkeletonable = true
                        tabItem.cornerRadius(8, true)
                        let animation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: .topLeftBottomRight)
                        tabItem.showAnimatedGradientSkeleton(animation: animation)
                    }
                }
                let viewProperties = StartLoadingView.ViewProperties(loadingCategoryItems: loadingCategoryItems,
                                                                     loadingLoadingCells : loadingLoadingCells,
                                                                     loadingTabItems     : loadingTabItems)
                self.mainView?.update(with: viewProperties)
        }
    }
    
    init(with mainView: StartLoadingView) {
        self.mainView = mainView
    }
}
