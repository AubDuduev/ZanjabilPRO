//
//  MapView.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 27.05.2022.
//
import Combine
import MapKit
import UIKit

final class MapView: UIView, MVVMViewProtocol {
    
    struct ViewProperties {
		var mapCamera     : MKMapCamera?
		var currentAddress: String
		var didTapMapView : ClosureEmpty
    }
	
	var updateViewProperties: Closure<ViewProperties>?
	var createViewProperties: Closure<ViewProperties>?
	
    var viewProperties: ViewProperties?
	
	@IBOutlet weak private var mapView            : MKMapView!
	@IBOutlet weak private var currentAddressLabel: UILabel!
	
	override func layoutSubviews() {
		super.layoutSubviews()
		self.setupMapView()
	}
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
		self.setup()
		self.setCurrentAddressLabel()
    }
	
	private func setCurrentAddressLabel(){
		guard let viewProperties = self.viewProperties else { return }
		self.currentAddressLabel.text = viewProperties.currentAddress
	}
	
	private func setup(){
		guard let mapCamera = self.viewProperties?.mapCamera else { return }
		self.mapView.camera = mapCamera
	}
	
	private func setupMapView(){
		self.cornerRadius(8, true)
		self.borderColor(.set(.greenThree), 2)
	}
	
	@IBAction func didTapMapViewGesture(gesture: UITapGestureRecognizer){
		self.viewProperties?.didTapMapView()
	}
    // MARK: - create view
    static func create() -> MapView {
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first as! MapView
        return view
    }
}
