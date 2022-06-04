//
//  MapModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 27.05.2022.
//
import MapKit
import UIKit

enum MapModel {
    
    case createViewProperties
	case setupLocationService
	case updateAddress(String)
	case updateCameraPosition(MKMapCamera)
}
