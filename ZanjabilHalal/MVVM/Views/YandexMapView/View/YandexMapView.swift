//
//  YandexMapView.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 18.06.2022.
//
import YandexMapsMobile
import UIKit

final class YandexMapView: UIView, MVVMViewProtocol {
    
    struct ViewProperties {
		var yandexCamera  : YMKCameraPosition?
		let animation     : YMKAnimation
		let cameraListener: YMKMapCameraListener
    }
    var viewProperties: ViewProperties?
	
	@IBOutlet weak private var mapView: YMKMapView!
	
	func create(with viewProperties: ViewProperties?) {
		self.viewProperties = viewProperties
	}
	
	func update(with viewProperties: ViewProperties?) {
		self.viewProperties = viewProperties
		self.setup()
	}
	
	private func setup() {
		guard let viewProperties = viewProperties else { return }
		guard let yandexCamera = viewProperties.yandexCamera else { return }
		mapView.mapWindow.map.move(
			with          : yandexCamera,
			animationType : viewProperties.animation,
			cameraCallback: nil)
		
		mapView.mapWindow.map.addCameraListener(with: viewProperties.cameraListener)
	}
    
    // MARK: - create view
    static func create() -> YandexMapView {
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first as! YandexMapView
        return view
    }
}
