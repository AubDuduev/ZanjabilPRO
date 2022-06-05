//
//  MapCollectionCellViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 22.05.2022.
//
import Foundation

final class MapCollectionCellViewModel: MVVMViewModelProtocol {
    
    public var model: MapCollectionCellModel? {
        didSet { self.stateMapModel() }
    }
    
    //MARK: - implementation protocol
    public var mainView: MapCollectionCell?
    public var isUpdate: ClosureEmpty?
    
    //MARK: - Main state view model
    private func stateMapModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties:
                print("")
        }
    }
    
    init(with mainView: MapCollectionCell) {
        self.mainView = mainView
    }
}
