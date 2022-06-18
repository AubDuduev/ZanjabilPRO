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
	private var geoPositioningService     : GeoPositioningService
	@Injected
	private var mapKitService             : MapKitService
	@Injected
	private var mainViewsBuilder          : MainViewsBuilder
	@Injected
	private var mainCollectionViewsBuilder: MainCollectionViewsBuilder
    //MARK: - implementation protocol
    public var mainView: MapScreenViewController?
	// MARK: - Private
	private var cancellable: Set<AnyCancellable> = []
	private var changeAddressViewModel: ChangeAddressViewModel!
	private var centerMapPinViewModel : CenterMapPinViewModel!
	private var agsMapViewViewModel   : AgsMapViewViewModel!
    //MARK: - Main state view model
    private func stateModel(){
        guard let model = self.model else { return }
        switch model {
			case .createViewProperties:
				let addChangeAddress: Closure<UIView> = { container in
					self.model = .addChangeAddress(container)
				}
				let addCenterMapPinView: Closure<UIView> = { container in
					self.model = .addCenterMapPinView(container)
				}
				let addAgsMapView: Closure<UIView> = { container in
					self.model = .addAgsMapView(container)
				}
				let viewProperties = MapScreenViewController.ViewProperties(addChangeAddress   : addChangeAddress,
																			addCenterMapPinView: addCenterMapPinView,
																			addAgsMapView      : addAgsMapView)
				self.mainView?.create(with: viewProperties)
			case .addChangeAddress(let container):
				self.changeAddressViewModel       = self.createChangeAddressViewModel(with: container)
				self.changeAddressViewModel.model = .createViewProperties
				self.changeAddressViewModel.model = .setupGeoPositioningService
			case .addCenterMapPinView(let container):
				self.centerMapPinViewModel       = self.createCenterMapPinViewModel(with: container)
				self.centerMapPinViewModel.model = .createViewProperties
			case .addAgsMapView(let container):
				self.agsMapViewViewModel       = self.createAgsMapViewModel(with: container)
				self.agsMapViewViewModel.model = .createViewProperties
				self.agsMapViewViewModel.model = .setupGeoPositioningService
			case .animationCenterPinImageView(let regionChange):
				self.centerMapPinViewModel.model = .animationCenterPinImageView(regionChange)
		}
    }
	
	private func createChangeAddressViewModel(with containerView: UIView) -> ChangeAddressViewModel {
		let changeAddressViewBuilder = self.mainViewsBuilder.createChangeAddressViewViewBuilder()
		let changeAddressView        = changeAddressViewBuilder.view
		containerView.addSubview(changeAddressView)
		changeAddressView.snp.makeConstraints { changeAddressView in
			changeAddressView.edges.equalToSuperview()
		}
		return changeAddressViewBuilder.viewModel
	}
	
	public func createCenterMapPinViewModel(with containerView: UIView) -> CenterMapPinViewModel {
		let centerMapPinViewBuilder = self.mainViewsBuilder.createCenterMapPinViewBuilder()
		let centerMapPinView        = centerMapPinViewBuilder.view
		containerView.addSubview(centerMapPinView)
		centerMapPinView.snp.makeConstraints { centerMapPinView in
			centerMapPinView.edges.equalToSuperview()
		}
		return centerMapPinViewBuilder.viewModel
	}
	
	public func createAgsMapViewModel(with containerView: UIView) -> AgsMapViewViewModel {
		let agsMapViewBuilder = self.mainViewsBuilder.createAgsMapViewBuilder()
		let agsMapView        = agsMapViewBuilder.view
		containerView.addSubview(agsMapView)
		agsMapView.snp.makeConstraints { agsMapView in
			agsMapView.edges.equalToSuperview()
		}
		return agsMapViewBuilder.viewModel
	}
	
    init(with mainView: MapScreenViewController) {
        self.mainView = mainView
    }
}
