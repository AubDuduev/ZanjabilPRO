//
//  PersistentService.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 02.04.2022.
//
//
import Foundation
import CoreData

struct PersistentService {
    
    //1 - Контекст в котором сохраняем данные
    static var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    //2 - Контейнер в котором все храниться
    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ZanjabilHalal")
        container.loadPersistentStores(completionHandler: {(storeDescription, error) in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    //3 - Сохронение в кнтейнер
    static func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                print("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    //4-
    private init(){}
}

