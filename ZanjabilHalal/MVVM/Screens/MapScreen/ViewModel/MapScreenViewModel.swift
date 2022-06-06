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
	// MARK: - Private
	private var cancellable: Set<AnyCancellable> = []
	private var changeAddressViewModel: ChangeAddressViewModel!
	private var centerMapPinViewModel : CenterMapPinViewModel!
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
				let addCenterMapPinView: Closure<UIView> = { container in
					self.model = .addCenterMapPinView(container)
				}
				let viewProperties = MapScreenViewController.ViewProperties(mapViewDelegate : self,
																			mapCamera       : nil,
																			addChangeAddress: addChangeAddress,
																			addCenterMapPinView: addCenterMapPinView)
				
				self.mainView?.create(with: viewProperties)
			case .updateCameraPosition(let mapCamera):
				self.mainView?.viewProperties?.mapCamera = mapCamera
				self.reloadProperties()
			case .addChangeAddress(let container):
				self.changeAddressViewModel = self.createChangeAddressViewModel(with: container)
				self.changeAddressViewModel.model = .createViewProperties
				self.changeAddressViewModel.model = .setupLocationService
			case .addCenterMapPinView(let container):
				self.centerMapPinViewModel = self.createCenterMapPinViewModel(with: container)
				self.centerMapPinViewModel.model = .createViewProperties
			case .animationCenterPinImageView(let isAnimationPin):
				self.centerMapPinViewModel.model = .animationCenterPinImageView(isAnimationPin)
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
	
    init(with mainView: MapScreenViewController) {
        self.mainView = mainView
    }
}
extension MapScreenViewModel: MKMapViewDelegate {
	
	func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
		let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "user")
//		annotationView.backgroundColor = .red
//		annotationView.frame.size = CGSize(width: 15, height: 15)
//		annotationView.cornerRadius(7.5, false)
//		annotationView.shadowColor(color: .black, radius: 10, opacity: 0.2)
//		annotationView.borderColor(.black, 1)
		return annotationView
	}
	
	func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
		//загрузку начинаем
		//self.viewModel.mapModel = .loadingGetPosition(false)
		//Анимация центрального пина
		self.model = .animationCenterPinImageView(true)
	}
	func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
		//self.viewModel.mapModel = .presentMyCoordinateName(mapView.camera.centerCoordinate)
		//Анимация центрального пина
		self.model = .animationCenterPinImageView(false)
		
		//self.mapViewData.currentCoordinate = mapView.camera.centerCoordinate
	}
	
	func mapViewDidFailLoadingMap(_ mapView: MKMapView, withError error: Error) {
		//загрузку заканчиваем
		//self.viewModel.mapModel = .loadingGetPosition(true)
	}
//	func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
//		return self.viewModel.managers.logic.createPolygon(overlay: overlay)
//	}
	
}
