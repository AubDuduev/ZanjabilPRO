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
    //MARK: - Main state view model
    private func stateModel(){
        guard let model = self.model else { return }
        switch model {
			case .setupLocationService:
				self.mapService.setupLocationService()
				self.mapService.startUserLocation()
			case .createViewProperties:
				
				let viewProperties = MapScreenViewController.ViewProperties(mapCamera: nil)
				
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
				
				self.reloadProperties()
			case .updateCameraPosition(let mapCamera):
				self.mainView?.viewProperties?.mapCamera = mapCamera
				self.reloadProperties()
		}
    }
	
    init(with mainView: MapScreenViewController) {
        self.mainView = mainView
    }
}
