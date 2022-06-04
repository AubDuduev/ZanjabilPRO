//
//  RequestProtocol.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.03.2022.
//
import Foundation

public protocol RequestProtocol {
   
   func request(data: Any?, completion: @escaping ClosureRequest)
}

