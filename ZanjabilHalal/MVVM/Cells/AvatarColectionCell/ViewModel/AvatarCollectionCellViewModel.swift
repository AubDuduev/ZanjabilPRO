//
//  AvatarCollectionCellViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 23.04.2022.
//
import Foundation

final class AvatarCollectionCellViewModel: MVVMViewModelProtocol {
    
    public var model: AvatarCollectionCellModel? {
        didSet { self.stateAvatarModel() }
    }
    
    //MARK: - implementation protocol
    public var mainView: AvatarCollectionCell?
    public var isUpdate: ClosureEmpty?
    
    //MARK: - Main state view model
    private func stateAvatarModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties(let profileCollectionCells):
                let viewProperties = AvatarCollectionCell.ViewProperties(profileCollectionCell: profileCollectionCells)
                self.mainView?.update(with: viewProperties)
        }
    }
    
    init(with mainView: AvatarCollectionCell) {
        self.mainView = mainView
    }
}
