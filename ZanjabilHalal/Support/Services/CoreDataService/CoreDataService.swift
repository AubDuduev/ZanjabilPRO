//
//  CoreDataService.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 02.04.2022.
//
//
import UIKit
import CoreData

final class CoreDataService {
	
	public func fetchName<T: NSManagedObject>(object: T.Type, key: CoreDataKey, name: String) -> T? {
		
		let fetchRequest: NSFetchRequest = NSFetchRequest<T>(entityName: String(describing: T.self) )
		fetchRequest.predicate = NSPredicate(format: "%@==\(key.rawValue)", name)
		do {
			let result = try PersistentService.context.fetch(fetchRequest).first
			return result
		} catch let error {
			print(error.localizedDescription, "Ошибка получения по имени объекта из CoreData")
		}
		return nil
	}
	public func fetch<T: NSManagedObject>(object: T.Type) -> T? {
		do {
			let result = try PersistentService.context.fetch(T.fetchRequest())
			return result.first as? T
		} catch let error {
			print(error.localizedDescription, "Ошибка получения одного объекта данного типа из CoreData")
			return nil
		}
	}
	public func fetchObjects<T: NSManagedObject>(object: T.Type) -> [T] {
		do {
			let result = try PersistentService.context.fetch(T.fetchRequest()) as! [T]
			return result
		} catch let error {
			print(error.localizedDescription, "Ошибка получения массив объектов данного типа из CoreData")
		}
		return []
	}
	public func create<T: NSManagedObject>(object: T.Type) -> T {
		let object = T(context: PersistentService.context)
		PersistentService.saveContext()
		return object
	}
	
	public func delete(object: NSManagedObject?){
		guard let object = object else { return }
		PersistentService.context.delete(object)
	}
	public func edit(){
		PersistentService.saveContext()
	}
	enum CoreDataKey: String, CaseIterable {
		case dishID = "id"
	}
}

