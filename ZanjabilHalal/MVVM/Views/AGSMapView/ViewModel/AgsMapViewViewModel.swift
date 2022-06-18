//
//  AgsMapViewViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 18.06.2022.
//
import Resolver
import ArcGIS
import Foundation
import Combine

final class AgsMapViewViewModel: MVVMViewModelProtocol {
    
    public var model: AgsMapViewModel? {
        didSet { self.stateAgsMapViewModel() }
    }
	// MARK: - DI
	@Injected
	private var geoPositioningService: GeoPositioningService
	@Injected
	private var mainRouter           : MainRouter
	@Injected
	private var agsMapService        : AgsMapService
    //MARK: - implementation protocol
    public var mainView: AgsMapView?
    public var isUpdate: ClosureEmpty?
	// MARK: - Private
	private var cancellable: Set<AnyCancellable> = []
    
    //MARK: - Main state view model
    private func stateAgsMapViewModel(){
        guard let model = self.model else { return }
        switch model {
			case .setupGeoPositioningService:
				self.geoPositioningService.setupLocationService()
				self.geoPositioningService.startUserLocation()
				
				// MARK: - возврат камеры карты
				self.geoPositioningService.completionAGSPoint
					.sink(receiveValue: { agsPoint in
						self.model = .updateCameraPoint(agsPoint)
						self.geoPositioningService.stopUserLocation()
					})
					.store(in: &self.cancellable)
            case .createViewProperties:
				let viewProperties = AgsMapView.ViewProperties(point: nil,
															   touchDelegate: self.agsMapService)
				self.mainView?.create(with: viewProperties)
            case .updateCameraPoint(let agsPoint):
				self.mainView?.viewProperties?.point = agsPoint
				self.reloadProperties()
        }
    }
    
    init(with mainView: AgsMapView) {
        self.mainView = mainView
    }
}
