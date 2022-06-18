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
	case addChangeAddress(UIView)
	case addCenterMapPinView(UIView)
	case addAgsMapView(UIView)
	case animationCenterPinImageView(RegionChange)
}
