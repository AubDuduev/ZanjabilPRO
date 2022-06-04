//
//  MapScreenViewController.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 22.05.2022.
//
import MapKit
import CoreLocation
import UIKit

final class MapScreenViewController: UIViewController, MVVMViewProtocol {
    
    //MARK: - Main ViewProperties
    struct ViewProperties {
		var mapCamera     : MKMapCamera?
    }
    var viewProperties: ViewProperties?
    
    //MARK: - Outlets
	@IBOutlet weak private var mapDataStackView   : UIStackView!
	@IBOutlet weak private var mapView            : MKMapView!
	@IBOutlet weak private var mapDataView        : UIView!
	@IBOutlet weak private var pinImageView       : UIImageView!
	
	func update(with viewProperties: ViewProperties?) {
		self.viewProperties = viewProperties
		self.setup()
		self.setupMapDataView()
	}
	
	private func setup(){
		guard let mapCamera = self.viewProperties?.mapCamera else { return }
		self.mapView.camera = mapCamera
	}
	
	private func setupMapDataView(){
		self.mapDataStackView.cornerRadius(radius: 16,
										   direction: .top,
										   clipsToBounds: true)
		self.mapDataView.cornerRadius(radius: 16,
									  direction: .top,
									  clipsToBounds: false)
		self.mapDataView.shadowColor(color : .set(.shadowBuyView),
									 radius: 10,
									 sizeW : 0,
									 sizeH : 0)
	}
	
	private func animationPin(){
		
	}
    
    init() {
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
