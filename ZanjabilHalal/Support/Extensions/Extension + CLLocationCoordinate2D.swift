//
//  Extension + CLLocationCoordinate2D.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 12.06.2022.
//
import CoreLocation
import Foundation

extension CLLocationCoordinate2D: Equatable {
	
	public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
		return	(lhs.longitude == rhs.longitude && lhs.latitude == rhs.latitude)
	}
}
