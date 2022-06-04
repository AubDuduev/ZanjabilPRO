//
//
//  OrdersService.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 30.04.2022.
//
//
import Resolver
import UIKit
import Combine

final class OrdersService: ServiceProtocol {
  
    // MARK: - DI
    @Injected
    private var networkService    : NetworkService
    @Injected
    private var localBasketService: LocalBasketService
    @Injected
    private var infoAlertService  : InfoAlertService
    
    public var subscribeUpdate = CurrentValueSubject<[DECOrder], Never>([])
    
    public var update: ClosureAny?
    
    public func getOrders(){
        self.networkService.requestFirebase.getOrders { orders in
            self.subscribeUpdate.send(orders)
        }
    }
    
    public func createOrder(with listMenu: [DECMenu]){
        guard !listMenu.isEmpty else { return }
        let order = self.createOrderBody(with: listMenu)
        self.networkService.requestFirebase.postOrder(body: order){ isSuccess in
            guard isSuccess else { return }
            self.infoAlertService.present(with: .paySuccess, dismiss: true)
        }
    }
    
    private func createOrderBody(with menuList: [DECMenu]) -> ENCOrder {
        var allDishes = menuList.compactMap{ $0.dishes }.flatMap{ $0 }
        let products  = self.localBasketService.getProducts()
        allDishes = allDishes.filter({ dish in
            return products.contains(where: { (dish.ID! == $0.id!) && ($0.count != 0) } )
        })
        let dishes = allDishes.compactMap { dish -> ENCDish in
            let count = self.dishesCount(with: dish.ID)
            let dish  = ENCDish(ID   : dish.ID,
                                name : dish.name,
                                price: dish.price,
                                count: count)
            return dish
        }
        let createDate = Date()
        let order      = ENCOrder(createDate: createDate,
                                  dishes    : dishes)
        return order
    }
    
    private func dishesCount(with dishID: String?) -> Int {
        let products = localBasketService.getProducts()
        let count = products.first(where: { $0.id == dishID} )?.count ?? 0
        return Int(count)
    }
}
