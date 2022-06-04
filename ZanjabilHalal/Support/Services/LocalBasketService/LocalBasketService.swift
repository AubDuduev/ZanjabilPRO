//
//  LocalBasketService.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 02.04.2022.
//
import CoreData
import Resolver
import Foundation

final class LocalBasketService: ServiceProtocol {
    
    @Injected
    private var coreDataService: CoreDataService
    
    public var update: ClosureAny?
    
    private func create(with dish: DECDish) -> BasketProduct {
        let basketProduct = BasketProduct(id   : dish.ID ?? "",
                                          price: dish.price ?? 0.0)
        return basketProduct
    }
    
    private func get(with dish: DECDish) -> BasketProduct? {
        let dishID = dish.ID ?? ""
        let basketProduct = self.coreDataService.fetchName(object: BasketProduct.self,
                                                           key   : .dishID,
                                                           name  : dishID)
        return basketProduct
    }
    
    public func getProducts() -> [BasketProduct] {
        let products = self.coreDataService.fetchObjects(object: BasketProduct.self)
        return products
    }
    
    public func getCount(with dish: DECDish) -> String {
        if let basketProduct = self.get(with: dish) {
            let count = basketProduct.count
            return String(count)
        } else {
            let basketProduct = self.create(with: dish)
            let count = basketProduct.count
            return String(count)
        }
    }
    
    public func getTotalPrice() -> Decimal {
        let products = self.getProducts()
        let totalPrice = products.reduce(0, { sum, product in (product.count.toDecimal * product.price.toDecimal) + sum })
        return totalPrice
    }
    
    public func addDish(with dish: DECDish){
        if let basketProduct = self.get(with: dish) {
            basketProduct.count += 1
        } else {
            let basketProduct = self.create(with: dish)
            basketProduct.count += 1
        }
        self.coreDataService.edit()
    }
    
    public func removeDish(with dish: DECDish){
        if let basketProduct = self.get(with: dish) {
            basketProduct.count -= 1
            guard basketProduct.count == 0 else { return }
            self.deleteProduct(with: dish)
        } 
        self.coreDataService.edit()
    }
    
    public func deleteProduct(with dish: DECDish){
        let basketProduct = self.get(with: dish)
        self.coreDataService.delete(object: basketProduct)
        self.coreDataService.edit()
    }
}
