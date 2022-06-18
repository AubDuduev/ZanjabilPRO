//
//
//  AgsMapService.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 18.06.2022.
//
//
import ArcGIS
import Foundation

final class AgsMapService: NSObject, ServiceProtocol, AGSGeoViewTouchDelegate {
  
	func geoView(_ geoView: AGSGeoView, didTapAtScreenPoint screenPoint: CGPoint, mapPoint: AGSPoint) {
		mapPoint.toCLLocationCoordinate2D()
	}
	
	func geoView(_ geoView: AGSGeoView, didTouchDragToScreenPoint screenPoint: CGPoint, mapPoint: AGSPoint) {
		
	}
	
	func geoView(_ geoView: AGSGeoView, didMoveLongPressToScreenPoint screenPoint: CGPoint, mapPoint: AGSPoint) {
		
	}
}

