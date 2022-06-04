//
//  UserData+CoreDataClass.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 09.05.2022.
//
//

import Foundation
import CoreData

@objc(UserData)
public class UserData: NSManagedObject {

	public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
		super.init(entity: entity, insertInto: context)
	}
	
	init() {
		self.init(context: PersistentService.context)
		self.firstName  = ""
		self.secondName = ""
		self.age        = 0
	}
}
