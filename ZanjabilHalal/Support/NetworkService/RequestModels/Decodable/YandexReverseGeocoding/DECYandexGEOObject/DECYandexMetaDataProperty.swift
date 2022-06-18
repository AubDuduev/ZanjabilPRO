//
//  DECYandexMetaDataProperty.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 18.06.2022.
//
import Foundation

struct DECYandexMetaDataProperty {
   
	let geocoderMetaData: DECYandexGeocoderMetaData?
   
   enum CodingKeys: String, CodingKey {
      case geocoderMetaData = "GeocoderMetaData"
   }
}
extension DECYandexMetaDataProperty: Decodable {
   
   init(from decoder: Decoder) throws {
      let values = try decoder.container(keyedBy: CodingKeys.self)
      self.geocoderMetaData = try? values.decode(DECYandexGeocoderMetaData?.self, forKey: .geocoderMetaData)
   }
}
