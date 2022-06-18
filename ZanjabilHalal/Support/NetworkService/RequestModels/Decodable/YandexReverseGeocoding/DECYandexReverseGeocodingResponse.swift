//
//  DECYandexReverseGeocodingResponse.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 18.06.2022.
//
import Foundation

struct DECYandexReverseGeocodingResponse {
   
	let geoObjectCollection: DECYandexGeoObjectCollection?
   
   enum CodingKeys: String, CodingKey {
      case geoObjectCollection = "GeoObjectCollection"
   }
}
extension DECYandexReverseGeocodingResponse: Decodable {
   
   init(from decoder: Decoder) throws {
      let values = try decoder.container(keyedBy: CodingKeys.self)
      self.geoObjectCollection = try? values.decode(DECYandexGeoObjectCollection?.self, forKey: .geoObjectCollection)
   }
}
