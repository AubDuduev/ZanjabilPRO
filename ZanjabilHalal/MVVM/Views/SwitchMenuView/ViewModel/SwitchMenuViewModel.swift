//
//  SwitchMenuViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 03.04.2022.
//
import Resolver
import Foundation
import Combine

final class SwitchMenuViewModel: MVVMViewModelProtocol {
    
    //MARK: - View
    public var mainView: SwitchMenuView?
    public var isUpdate: ClosureEmpty?
    
    public var modelSwitchMenu: SwitchMenuModel? {
        didSet { self.logicSwitchMenuModel() }
    }
	// MARK: - DI
	@Injected
	private var feedbackGeneratorService: FeedbackGeneratorService
	// MARK: - Private
    private var completionMenuState: Closure<MenuState>!
    private var cancellable        : Set<AnyCancellable> = []
    
    private func logicSwitchMenuModel(){
        guard let model = self.modelSwitchMenu else { return }
        switch model {
            //создание свойств view
            case .createViewProperties(let completionMenuState):
                let didActionSwitchStateMenu: Closure<Int> = { changeIndex in
                    self.modelSwitchMenu = .switchMenuState(changeIndex: changeIndex)
                }
                self.completionMenuState = completionMenuState
                let viewProperties = SwitchMenuView.ViewProperties(menuState               : .vertical,
                                                                   didActionSwitchStateMenu: didActionSwitchStateMenu)
                
                self.updateMainView(with: viewProperties)
            //обновление свойств view
            case .switchMenuState(let changeIndex):
                let menuState = MenuState(rawValue: changeIndex) ?? .vertical
                self.completionMenuState?(menuState)
                self.mainView?.viewProperties?.menuState = menuState
                self.reloadProperties()
				self.feedbackGeneratorService.vibration()
        }
    }
    
    init(with mainView: SwitchMenuView) {
        self.mainView = mainView
    }
}
