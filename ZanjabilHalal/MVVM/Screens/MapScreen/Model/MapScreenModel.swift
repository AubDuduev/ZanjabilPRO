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
	case setupLocationService
	case updateAddress(String)
	case updateCameraPosition(MKMapCamera)
}
