//
//
//  ArcGISService.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 18.06.2022.
//
//
import ArcGIS
import Foundation

final class ArcGISService: ServiceProtocol {
  
    public var update: ClosureAny?
	
	private let apiKey = "AAPK92cb676747634f198af686889f1defd0xGaFfem3xTBogvV_Z__l4lJ6tRkvG17YQHyz-XSxQRSNZLRnDrMUm1toip1pebo1"
	
	public func setup(){
		AGSArcGISRuntimeEnvironment.apiKey = apiKey
	}
}
