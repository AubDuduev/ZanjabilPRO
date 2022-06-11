//
//  MapScreenViewController.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 22.05.2022.
//
import MapKit
import CoreLocation
import UIKit

private typealias R = TextResources.Navigation.NavigationTitle

final class MapScreenViewController: UIViewController, MVVMViewProtocol {
    
    //MARK: - Main ViewProperties
    struct ViewProperties {
		let mapViewDelegate    : MKMapViewDelegate
		var mapCamera          : MKMapCamera?
		var addChangeAddress   : Closure<UIView>
		var addCenterMapPinView: Closure<UIView>
    }
    var viewProperties: ViewProperties?
    
    //MARK: - Outlets
	@IBOutlet weak private var mapView                   : MKMapView!
	@IBOutlet weak private var containerChangeAddressView: UIView!
	@IBOutlet weak private var containerCenterMapPinView : UIView!
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.setTitle()
	}
	
	private func setTitle(){
		self.title = R.map.localizedString()
	}
	
	func create(with viewProperties: ViewProperties?) {
		self.viewProperties = viewProperties
		self.setup()
		self.setupContainerChangeAddressView()
		self.viewProperties?.addChangeAddress(self.containerChangeAddressView)
		self.viewProperties?.addCenterMapPinView(self.containerCenterMapPinView)
	}
	
	func update(with viewProperties: ViewProperties?) {
		self.viewProperties = viewProperties
		self.setup()
		self.setupContainerChangeAddressView()
	}
	
	private func setup(){
		guard let mapCamera       = self.viewProperties?.mapCamera else { return }
		guard let mapViewDelegate = self.viewProperties?.mapViewDelegate else { return }
		self.mapView.camera   = mapCamera
		self.mapView.delegate = mapViewDelegate
	}
	
	private func setupContainerChangeAddressView(){
		self.containerChangeAddressView.cornerRadius(radius: 16,
													 direction: .top,
													 clipsToBounds: false)
		self.containerChangeAddressView.shadowColor(color : .set(.shadowBuyView),
													radius: 10,
													sizeW : 0,
													sizeH : 0)
	}
    
    init() {
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
