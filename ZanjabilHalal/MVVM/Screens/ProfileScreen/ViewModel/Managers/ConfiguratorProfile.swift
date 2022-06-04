//
//  ConfiguratorProfile.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 13.03.2022.
//
import Resolver
import UIKit

final class ConfiguratorProfile {
    
    //MARK: - Public variable
    public unowned let VM: ProfileViewModel
    
    @Injected
    private var mainViewsBuilder: MainViewsBuilder
    @Injected
    private var mainCollectionViewsBuilder: MainCollectionViewsBuilder
    
    public func createProfileViewModel(with containerView: UIView) -> ProfileCollectionViewModel {
        let profileCollectionViewBuilder = self.mainCollectionViewsBuilder.createProfileCollectionViewBuilder()
        let profileCollectionView        = profileCollectionViewBuilder.view
        containerView.addSubview(profileCollectionView)
        profileCollectionView.snp.makeConstraints { profileCollectionView in
            profileCollectionView.edges.equalToSuperview()
        }
        return profileCollectionViewBuilder.viewModel
    }
    
    //MARK: - Inition
    init(with viewModel: ProfileViewModel) {
        self.VM = viewModel
    }
}
