//
//  ServerRequest4s.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.03.2022.
//
import Foundation

final class ServerRequests {
    
    //MARK: - Create type request
    public func set(type: RequestType) -> RequestProtocol? {
        switch type {
                //GETs
            case .GET:
                return nil
                //POSTs
            case .POST:
                return nil
                //PATCHs
            case .PATCH:
                return nil
        }
    }
    
    enum RequestType {
        //GET
        case GET
        //POST
        case POST
        //PATCH
        case PATCH
    }
}
