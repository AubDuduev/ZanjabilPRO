//
//  URLBodyService.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.03.2022.
//
import Resolver
import UIKit

final class URLBody {
    
    @Injected
    var jsonEncoderService: JSONEncoderService
    
    enum EncodableDefault<T: Encodable> {
        
        case `default`(T)
    }
	
	enum EncodableType {
		
		case addressSuggestion(ENCAddressSuggestion)
		case coordinate(ENCCoordinate)
		case deliveryCheckPrice(ENCDeliveryCheckPrice)
	}
    
    public func create<T: Encodable>(with encodableType: EncodableDefault<T>) -> Data? {
        
        switch encodableType {
                
            case .default(let encode):
                return jsonEncoderService.encode(with: encode.self)
        }
    }
	
	public func create(with encodableType: EncodableType) -> Data? {
		
		switch encodableType {
			case .addressSuggestion(let addressSuggestion):
				let data = jsonEncoderService.encode(with: addressSuggestion)
				return data
			case .coordinate(let coordinate):
				let data = jsonEncoderService.encode(with: coordinate)
				return data
			case .deliveryCheckPrice(let deliveryCheckPrice):
				let data = jsonEncoderService.encode(with: deliveryCheckPrice)
				print(String(decoding: data!, as: UTF8.self))
				return data
		}
	}
}
