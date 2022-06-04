//
//  NetworkService.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.03.2022.
//
import UIKit

final class NetworkService {
    
    //MARK: - Private variable
    private var requestoble          : RequestProtocol!
    private let internetСheckService = InternetСheckService()
    
    public let requestFirebase = RequestFirebase()
    
}
