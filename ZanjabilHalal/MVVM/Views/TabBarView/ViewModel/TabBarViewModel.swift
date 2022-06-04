//
//  TabBarViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 01.05.2022.
//
import AnimatedGradientView
import UIKit
import Resolver

typealias Resources = TextResources.TabBar

final class TabBarViewModel: MVVMViewModelProtocol {
    
    public var model: TabBarModel? {
        didSet { self.stateTabBarModel() }
    }
    // MARK: - DI
    @Injected
    private var mainTabBarRouter        : MainTabBarRouter
    @Injected
    private var menuService             : MenuService
	@Injected
	private var feedbackGeneratorService: FeedbackGeneratorService
    // MARK: - implementation protocol
    public var mainView: TabBarView?
    public var isUpdate: ClosureEmpty?
    // MARK: - Main state view model
    private func stateTabBarModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties:
                let didTapActionButton: Closure<Int> = { tagIndex in
                    self.model = .animationClick(tagIndex)
                }
                let viewProperties = TabBarView.ViewProperties(didTapActionButton: didTapActionButton)
                self.mainView?.update(with: viewProperties)
            case .setup(let bottomPadding):
                self.setup(bottomPadding: bottomPadding)
            case .animationClick(let tag):
                self.animationClick(tag: tag)
                self.mainTabBarRouter.switchTabBarVC(with: tag)
        }
    }
    
    private func setup(bottomPadding: CGFloat){
        //Stack view
        self.mainView?.topCommonStackViewConstant.constant = 10
        self.mainView?.sectionStackViews.forEach { $0.spacing = 5 }
        //Labels
        self.mainView?.titleLabels.forEach { $0.text = Resources.Text.allCases[$0.tag].localizedString() }
        self.mainView?.titleLabels.forEach { $0.font = .set(.rubikRegular, 10) }
        self.mainView?.heightLabelsConstant.forEach { $0.constant = 14 }
        //Images
        self.mainView?.iconsImageViews.forEach { $0.tintColor = .clear}
        self.mainView?.iconsImageViews.forEach { $0.image     = UIImage(named: TabBarImage.allCases[$0.tag].rawValue )}
        //Background
        self.mainView?.iconsImageViews.forEach { $0.backgroundColor = .clear }
        self.mainView?.titleLabels.forEach     { $0.backgroundColor = .clear }
        self.mainView?.iconsViews.forEach      { $0.backgroundColor = .clear }
        self.mainView?.iconsImageViews[0].tintColor = .set(.greenFore)
        self.animationClick(tag: 0)
        //padding
        self.mainView?.bottomCommonStackViewConstant.constant = 5
    }
    
    private func animationClick(tag: Int){
        UIView.animate(withDuration          : 0,
                       delay                 : 0,
                       usingSpringWithDamping: 0,
                       initialSpringVelocity : 0,
                       options               : .curveEaseInOut, animations: {
            //Images set color
            self.mainView?.iconsImageViews.forEach { $0.tintColor = .set(.greenThree) }
            self.mainView?.iconsImageViews[tag].tintColor         = .set(.greenFore)
            //Label set color
            self.mainView?.titleLabels.forEach     { $0.textColor = .set(.greenThree) }
            self.mainView?.titleLabels[tag].textColor             = .set(.greenFore)
        })
        self.changesWhenSwitchingTabBar()
    }
    
    private func changesWhenSwitchingTabBar(){
        self.menuService.updateSubscribers()
		self.feedbackGeneratorService.vibration()
    }
    
    init(with mainView: TabBarView) {
        self.mainView = mainView
    }
}
