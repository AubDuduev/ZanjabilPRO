//
//  MapViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 27.05.2022.
//
import Combine
import CoreLocation
import MapKit
import Resolver
import Foundation

final class MapViewModel: MVVMViewModelProtocol {
    
    public var model: MapModel? {
        didSet { self.stateMapModel() }
    }
    // MARK: - DI
	@Injected
	private var mapService: MapService
	@Injected
	private var mainRouter: MainRouter
    //MARK: - implementation protocol
	var viewProperties: MapView.ViewProperties?
	// MARK: - Private
	private var cancellable: Set<AnyCancellable> = []
    
    //MARK: - Main state view model
    private func stateMapModel(){
        guard let model = self.model else { return }
        switch model {
			case .setupLocationService:
				self.mapService.setupLocationService()
				self.mapService.startUserLocation()
            case .createViewProperties:
				let didTapMapView: ClosureEmpty = {
					self.mainRouter.pushMainNavigation(id: .mapScreenVC, animated: true)
					self.mainRouter.setupMainNavigationVC(isNavigationBarHidden: false, animatedHidden: true, tintColor: .set(.greenFore))
				}
				
				let viewProperties = MapView.ViewProperties(mapCamera     : nil,
															currentAddress: "",
															didTapMapView : didTapMapView)
				
				self.mapService.completionAddress
					.sink(receiveValue: { address in
						//guard let self = self else { return }
						self.model = .updateAddress(address)
					})
					.store(in: &self.cancellable)
				
				self.mapService.completionMapCamera
					.sink(receiveValue: { mapCamera in
						//guard let self = self else { return }
						self.model = .updateCameraPosition(mapCamera)
						self.mapService.stopUserLocation()
					})
					.store(in: &self.cancellable)
				self.mainView?.update(with: viewProperties)
			case .updateAddress(let currentAddress):
				self.mainView?.viewProperties?.currentAddress = currentAddress
				self.reloadProperties()
			case .updateCameraPosition(let mapCamera):
				self.mainView?.viewProperties?.mapCamera = mapCamera
				self.reloadProperties()
        }
    }
    
    init(with mainView: MapView) {
        self.mainView = mainView
    }
}
