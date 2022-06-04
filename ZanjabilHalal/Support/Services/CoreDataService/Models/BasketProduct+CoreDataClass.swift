//
//  BasketProduct+CoreDataClass.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 16.04.2022.
//
//
import Foundation
import CoreData

@objc(BasketProduct)
public class BasketProduct: NSManagedObject {

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
    
    init(id: String, price: Decimal) {
        self.init(context: PersistentService.context)
        self.count = 0
        self.id    = id
        self.price = price as NSDecimalNumber
    }
}
