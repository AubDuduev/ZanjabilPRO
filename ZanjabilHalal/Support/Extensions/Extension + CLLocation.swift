
import CoreLocation

extension CLLocation {
	func fetchAddress(completion: @escaping (_ address: String?, _ error: Error?) -> ()) {
		CLGeocoder().reverseGeocodeLocation(self) {
			let placeMark = $0?.first
			let address = self.createAddress(placeMark?.thoroughfare,
											 placeMark?.subThoroughfare,
											 placeMark?.locality,
											 placeMark?.subLocality,
											 placeMark?.administrativeArea,
											 placeMark?.postalCode,
											 placeMark?.country)

			completion(address, $1)
		}
	}
	
	private func createAddress(_ texts: String?...) -> String {
		var address = texts.compactMap({ $0 }).joined(separator: ", ")
		address = String(address.dropLast())
		return address
	}
}
