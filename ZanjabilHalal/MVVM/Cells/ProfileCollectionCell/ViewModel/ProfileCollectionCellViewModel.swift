//
//  ProfileCollectionCellViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 22.04.2022.
//
import Resolver
import UIKit

final class ProfileCollectionCellViewModel: MVVMViewModelProtocol {
    
    public var model: ProfileCollectionCellModel? {
        didSet { self.stateProfileModel() }
    }
    // MARK: - DI
    @Injected
    private var mainRouter      : MainRouter
    //MARK: - implementation protocol
    public var mainView: ProfileCollectionCell?
    public var isUpdate: ClosureEmpty?
    
    //MARK: - Main state view model
    private func stateProfileModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties(let profileCollectionCells):
                let didAction: Closure<ProfileCollectionCellType> = { profileCollectionCellType in
                   
                    switch profileCollectionCells {
                        case .avatar:
                            print("")
                        case .name:
							self.mainRouter.pushMainNavigation(id: .changeUserNameVC, animated: true)
							self.mainRouter.setupMainNavigationVC(isNavigationBarHidden: false, animatedHidden: true, tintColor: .set(.greenFore))
                        case .orders:
                            self.mainRouter.pushMainNavigation(id: .ordersVC, animated: true)
                            self.mainRouter.setupMainNavigationVC(isNavigationBarHidden: false, animatedHidden: true, tintColor: .set(.greenFore))
                        case .addresses:
                            self.mainRouter.pushMainNavigation(id: .addressesVC, animated: true)
                            self.mainRouter.setupMainNavigationVC(isNavigationBarHidden: false, animatedHidden: true, tintColor: .set(.greenFore))
                        case .card:
                            print("")
                    }
                }
                let viewProperties = ProfileCollectionCell.ViewProperties(profileCollectionCell: profileCollectionCells,
                                                                          didAction            : didAction)
                self.mainView?.update(with: viewProperties)
        }
    }
    
    init(with mainView: ProfileCollectionCell) {
        self.mainView = mainView
    }
}
