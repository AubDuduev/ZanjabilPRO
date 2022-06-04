
import CoreLocation

extension CLLocation {
   func fetchAddress(completion: @escaping (_ address: String?, _ error: Error?) -> ()) {
      CLGeocoder().reverseGeocodeLocation(self) {
         let placeMark = $0?.first
         var address = ""
         if let subThoroughfare = placeMark?.subThoroughfare {
            address = address + subThoroughfare + ", "
         }
         if let thoroughfare = placeMark?.thoroughfare {
            address = address + thoroughfare + ", "
         }
         if let locality = placeMark?.locality {
            address = address + locality + ", "
         }
         if let subLocality = placeMark?.subLocality {
            address = address + subLocality + ", "
         }
         if let administrativeArea = placeMark?.administrativeArea {
            address = address + administrativeArea + ", "
         }
         if let postalCode = placeMark?.postalCode {
            address = address + postalCode + ", "
         }
         if let country = placeMark?.country {
            address = address + country + ", "
         }
         if address.last == "," {
            address = String(address.dropLast())
         }
         completion(address, $1)
      }
   }
}
