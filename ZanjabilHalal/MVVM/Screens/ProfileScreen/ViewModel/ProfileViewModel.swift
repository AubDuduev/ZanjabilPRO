//
//  ProfileViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 13.03.2022.
//
import UIKit
import Resolver

final class ProfileViewModel: MVVMViewModelProtocol {
    
    public var model: ProfileModel? {
        didSet { self.stateProfileModel() }
    }
    //MARK: - implementation protocol
    public var mainView: ProfileViewController?
    public var isUpdate: ClosureEmpty?
    //MARK: - Managers
    lazy public var managers = ProfileManagers(with: self)
    // MARK: - Private
    private var profileCollectionViewModel: ProfileCollectionViewModel!
    
    private func stateProfileModel(){
        guard let model = self.model else { return }
        
        switch model {
            case .createViewProperties:
                
                let addProfileCollection: Closure<UIView> = { containerView in
                    self.model = .addProfileCollectionView(containerView)
                }
                
                let viewDidLoad: ClosureEmpty = {
                    
                }
                
                let viewProperties = ProfileViewController.ViewProperties(addProfileCollection: addProfileCollection,
                                                                          viewDidLoad         : viewDidLoad)
                self.mainView?.update(with: viewProperties)
            case .addProfileCollectionView(let containerView):
                self.profileCollectionViewModel = self.managers.configurator.createProfileViewModel(with: containerView)
                self.profileCollectionViewModel.model = .createViewProperties
                self.profileCollectionViewModel.model = .getAddress
        }
    }
    
    init(with mainView: ProfileViewController) {
        self.mainView = mainView
    }
}
