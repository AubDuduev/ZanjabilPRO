//
//  MapModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 22.05.2022.
//
import MapKit
import UIKit

enum MapScreenModel {
    
	case createViewProperties
	case setupGeoPositioningService
	case createAddressForCoordinate(CLLocationCoordinate2D)
	case updateCameraPosition(MKMapCamera)
	case addChangeAddress(UIView)
	case addCenterMapPinView(UIView)
	case animationCenterPinImageView(RegionChange)
}
