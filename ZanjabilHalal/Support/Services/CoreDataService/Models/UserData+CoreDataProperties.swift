//
//  UserData+CoreDataProperties.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 09.05.2022.
//
//
import Foundation
import CoreData

extension UserData {
	
	@nonobjc public class func fetchRequest() -> NSFetchRequest<UserData> {
		return NSFetchRequest<UserData>(entityName: "UserData")
	}
	
	@NSManaged public var firstName : String?
	@NSManaged public var secondName: String?
	@NSManaged public var age       : Int16
}

extension UserData : Identifiable {
	
}
