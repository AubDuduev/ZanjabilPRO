//
//  BasketProduct+CoreDataProperties.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 16.04.2022.
//
//

import Foundation
import CoreData


extension BasketProduct {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BasketProduct> {
        return NSFetchRequest<BasketProduct>(entityName: "BasketProduct")
    }

    @NSManaged public var count: Int16
    @NSManaged public var id   : String?
    @NSManaged public var price: NSDecimalNumber

}

extension BasketProduct : Identifiable {

}
