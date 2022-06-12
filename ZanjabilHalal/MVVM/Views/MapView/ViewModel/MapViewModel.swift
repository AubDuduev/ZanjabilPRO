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
	private var geoPositioningService: GeoPositioningService
	@Injected
	private var mainRouter           : MainRouter
    //MARK: - implementation protocol
    public var mainView: MapView?
    public var isUpdate: ClosureEmpty?
	// MARK: - Private
	private var cancellable: Set<AnyCancellable> = []
    
    //MARK: - Main state view model
    private func stateMapModel(){
        guard let model = self.model else { return }
        switch model {
			case .setupGeoPositioningService:
				self.geoPositioningService.setupLocationService()
				self.geoPositioningService.startUserLocation()
				
				self.geoPositioningService.completionAddress
					.sink(receiveValue: { address in
						self.model = .updateAddress(address)
					})
					.store(in: &self.cancellable)
				
				self.geoPositioningService.completionMapCamera
					.sink(receiveValue: { mapCamera in
						self.model = .updateCameraPosition(mapCamera)
						self.geoPositioningService.stopUserLocation()
					})
					.store(in: &self.cancellable)
				
            case .createViewProperties:
				let didTapMapView: ClosureEmpty = {
					self.mainRouter.pushMainNavigation(id: .mapScreenVC, animated: true)
					self.mainRouter.setupMainNavigationVC(isNavigationBarHidden: false, animatedHidden: true, tintColor: .set(.greenFore), title: .map)
				}
				
				let viewProperties = MapView.ViewProperties(mapCamera     : nil,
															currentAddress: "",
															didTapMapView : didTapMapView)
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
