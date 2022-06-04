//
//  RequestFirebase.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 13.03.2022.
//
import Foundation

final class RequestFirebase {
	
	// MARK: - GET
	public func getRestaurants(){
		let restaurants = GETRestaurants()
		restaurants.request { requestResult in
			
		}
	}
	public func getRestaurantMenu(completion: @escaping Closure<[DECMenu]>){
		let getRestaurantMenu = GETRestaurantMenu()
		getRestaurantMenu.request { requestResult in
			DispatchQueue.main.async {
				switch  requestResult {
					case .error(let error):
						print(error ?? "")
					case .object(let menuList):
						let menuList = menuList as! [DECMenu]
						completion(menuList)
				}
			}
		}
	}
	public func getUserAddresses(completion: @escaping Closure<[DECAddress]>){
		let getAddresses = GETAddresses()
		getAddresses.request { requestResult in
			DispatchQueue.main.async {
				switch  requestResult {
					case .error(let error):
						print(error ?? "")
					case .object(let addresses):
						let addresses = addresses as! [DECAddress]
						completion(addresses)
				}
			}
		}
	}
	public func getOrders(completion: @escaping Closure<[DECOrder]>){
		let getOrders = GETOrders()
		getOrders.request { requestResult in
			DispatchQueue.main.async {
				switch  requestResult {
					case .error(let error):
						print(error ?? "")
					case .object(let orders):
						let orders = orders as! [DECOrder]
						completion(orders)
				}
			}
		}
	}
	// MARK: - POST
	public func postAddress(body: ENCAddress, completion: @escaping Closure<Bool>){
		let restaurants = POSTAddress()
		restaurants.request(data: body) { requestResult in
			DispatchQueue.main.async {
				switch  requestResult {
					case .error(let error):
						print(error ?? "")
					case .object(let isSuccess):
						let isSuccess = isSuccess as! Bool
						completion(isSuccess)
				}
			}
		}
	}
	
	public func postAddresses(body: [ENCAddress], completion: @escaping Closure<Bool>){
		let restaurants = POSTAddresses()
		restaurants.request(data: body) { requestResult in
			DispatchQueue.main.async {
				switch  requestResult {
					case .error(let error):
						print(error ?? "")
					case .object(let isSuccess):
						let isSuccess = isSuccess as! Bool
						completion(isSuccess)
				}
			}
		}
	}
	
	public func postOrder(body: ENCOrder, completion: @escaping Closure<Bool>){
		let postOrder = POSTOrder()
		postOrder.request(data: body) { requestResult in
			DispatchQueue.main.async {
				switch  requestResult {
					case .error(let error):
						print(error ?? "")
					case .object(let isSuccess):
						let isSuccess = isSuccess as! Bool
						completion(isSuccess)
				}
			}
		}
	}
	// MARK: - DELETE
	public func deleteAddress(body: ENCAddress, completion: @escaping Closure<Bool>){
		let deleteAddress = DELETEAddress()
		deleteAddress.request(data: body) { requestResult in
			DispatchQueue.main.async {
				switch  requestResult {
					case .error(let error):
						print(error ?? "")
					case .object(let isSuccess):
						let isSuccess = isSuccess as! Bool
						completion(isSuccess)
				}
			}
		}
	}
}

enum RequestFirebaseError: LocalizedError {
	case invalidGetDocument
	case invalidGetCollection
	case invalidInternet
}
