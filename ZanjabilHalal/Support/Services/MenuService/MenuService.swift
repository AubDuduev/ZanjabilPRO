//
//
//  MenuService.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 16.04.2022.
//
//
import Combine
import Foundation

final class MenuService: ServiceProtocol {
  
    public var update: ClosureAny?
    
    public var subscribeUpdateMenu = CurrentValueSubject<[DECMenu], Never>([])
    
    private let requestFirebase = RequestFirebase()
    private var menuList        : [DECMenu] = []
    
    public func getMenu(){
        self.requestFirebase.getRestaurantMenu { menuList in
            self.menuList = menuList
            self.subscribeUpdateMenu.send(self.menuList)
        }
    }
    
    public func updateSubscribers(){
        guard !self.menuList.isEmpty else { return }
        self.subscribeUpdateMenu.send(self.menuList)
    }
}
