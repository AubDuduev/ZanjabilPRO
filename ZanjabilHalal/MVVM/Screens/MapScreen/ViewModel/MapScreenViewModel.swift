//
//  MapScreenViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 22.05.2022.
//
import Combine
import CoreLocation
import Resolver
import Foundation
import MapKit

final class MapScreenViewModel: NSObject, MVVMViewModelProtocol {
    
    public var model: MapScreenModel? {
        didSet { self.stateModel() }
    }
	// MARK: - DI
	@Injected
	private var mapService                : MapService
	@Injected
	private var mainViewsBuilder          : MainViewsBuilder
	@Injected
	private var mainCollectionViewsBuilder: MainCollectionViewsBuilder
    //MARK: - implementation protocol
    public var mainView: MapScreenViewController?
    public var isUpdate: ClosureEmpty?
	// MARK: - Private
	private var cancellable: Set<AnyCancellable> = []
	private var changeAddressViewModel: ChangeAddressViewModel!
    //MARK: - Main state view model
    private func stateModel(){
        guard let model = self.model else { return }
        switch model {
			case .setupLocationService:
				self.mapService.setupLocationService()
				self.mapService.startUserLocation()
				self.mapService.completionMapCamera
					.sink(receiveValue: { mapCamera in
						//guard let self = self else { return }
						self.model = .updateCameraPosition(mapCamera)
						self.mapService.stopUserLocation()
					})
					.store(in: &self.cancellable)
			case .createViewProperties:
				let addChangeAddress: Closure<UIView> = { container in
					self.model = .addChangeAddress(container)
				}
				let viewProperties = MapScreenViewController.ViewProperties(mapCamera: nil,
																			addChangeAddress: addChangeAddress)
				
				self.mainView?.create(with: viewProperties)
			case .updateCameraPosition(let mapCamera):
				self.mainView?.viewProperties?.mapCamera = mapCamera
				self.reloadProperties()
			case .addChangeAddress(let container):
				self.changeAddressViewModel = self.createChangeAddressViewModel(with: container)
				self.changeAddressViewModel.model = .createViewProperties
				self.changeAddressViewModel.model = .setupLocationService
		}
    }
	
	public func createChangeAddressViewModel(with containerView: UIView) -> ChangeAddressViewModel {
		let changeAddressViewBuilder = self.mainViewsBuilder.createChangeAddressViewViewBuilder()
		let changeAddressView        = changeAddressViewBuilder.view
		containerView.addSubview(changeAddressView)
		changeAddressView.snp.makeConstraints { changeAddressView in
			changeAddressView.edges.equalToSuperview()
		}
		return changeAddressViewBuilder.viewModel
	}
	
    init(with mainView: MapScreenViewController) {
        self.mainView = mainView
    }
}
