//
//  YandexMapViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 18.06.2022.
//
import Combine
import CoreLocation
import YandexMapsMobile
import Resolver
import Foundation

final class YandexMapViewModel: MVVMViewModelProtocol {
    
    public var model: YandexMapModel? {
        didSet { self.stateYandexMapModel() }
    }
	// MARK: - DI
	@Injected
	private var geoPositioningService         : GeoPositioningService
	@Injected
	private var yandexMapCameraListenerService: YandexMapCameraListenerService
    //MARK: - implementation protocol
    public var mainView: YandexMapView?
    public var isUpdate: ClosureEmpty?
	// MARK: - Private
	private var cancellable: Set<AnyCancellable> = []
    
    //MARK: - Main state view model
    private func stateYandexMapModel(){
        guard let model = self.model else { return }
        switch model {
			case .setupGeoPositioningService:
				self.geoPositioningService.setupLocationService()
				self.geoPositioningService.startUserLocation()
				// MARK: - возврат камеры карты
				self.geoPositioningService.completionYandexCamera
					.sink(receiveValue: { yandexCamera in
						self.model = .updateCameraPosition(yandexCamera)
						self.geoPositioningService.stopUserLocation()
					})
					.store(in: &self.cancellable)
				
            case .createViewProperties:
				let animation      = YMKAnimation(type: .linear, duration: 2)
				let viewProperties = YandexMapView.ViewProperties(yandexCamera  : nil,
																  animation     : animation,
																  cameraListener: yandexMapCameraListenerService)
				self.mainView?.create(with: viewProperties)
            case .updateCameraPosition(let yandexCamera):
				self.mainView?.viewProperties?.yandexCamera = yandexCamera
				self.reloadProperties()
        }
    }
    
    init(with mainView: YandexMapView) {
        self.mainView = mainView
    }
}
