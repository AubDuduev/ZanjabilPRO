//
//  AgsMapViewView.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 18.06.2022.
//
import ArcGIS
import UIKit

final class AgsMapView: UIView, MVVMViewProtocol {
    
    struct ViewProperties {
		var point        : AGSViewpoint?
		let touchDelegate: AGSGeoViewTouchDelegate
    }
    var viewProperties: ViewProperties?
	
	@IBOutlet weak private var mapView: AGSMapView!
    
	func create(with viewProperties: ViewProperties?) {
		self.viewProperties = viewProperties
		self.setupMap()
	}
	
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
		self.setupMap()
    }
	
	private func setupMap() {
		guard let point = self.viewProperties?.point else { return }
		guard let touchDelegate = self.viewProperties?.touchDelegate else { return }
		let map = AGSMap(basemapStyle: .arcGISNavigation)
		mapView.map = map
		mapView.setViewpoint(point)
		mapView.touchDelegate = touchDelegate
		self.mapView.locationDisplay.start { [weak self] error in
			if let error = error {
				print(error)
			}
			self?.mapView.locationDisplay.autoPanMode = .recenter
		}
		mapView.viewpointChangedHandler = { [self] in
			let point = self.mapView?.currentViewpoint(with: .centerAndScale)
			
			
		}
	}

    // MARK: - create view
    static func create() -> AgsMapView {
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first as! AgsMapView
        return view
    }
}
