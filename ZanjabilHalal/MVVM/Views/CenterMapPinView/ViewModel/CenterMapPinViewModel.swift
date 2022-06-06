//
//  CenterMapPinViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.06.2022.
//
import Foundation

final class CenterMapPinViewModel: MVVMViewModelProtocol {
    
    public var model: CenterMapPinModel? {
        didSet { self.stateCenterMapPinModel() }
    }
    
    //MARK: - implementation protocol
    public var mainView: CenterMapPinView?
    
    //MARK: - Main state view model
    private func stateCenterMapPinModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties:
				let viewProperties = CenterMapPinView.ViewProperties(isAnimationPin: false)
				self.mainView?.create(with: viewProperties)
			case .animationCenterPinImageView(let isAnimationPin):
				self.mainView?.viewProperties?.isAnimationPin = isAnimationPin
				self.reloadProperties()
        }
    }
    
    init(with mainView: CenterMapPinView) {
        self.mainView = mainView
    }
}
