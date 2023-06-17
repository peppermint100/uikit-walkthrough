//
//  TodoListItemManager.swift
//  TodoListCodeData
//
//  Created by peppermint100 on 2023/06/15.
//

import UIKit
import CoreData

final class TodoListItemManager {
    
    static let shared = TodoListItemManager()
    private init() {}
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    lazy var context = appDelegate?.persistentContainer.viewContext
    
    let todoModelName = "TodoListItem"
    
    func getTodos() -> [TodoListItem] {
        let request:NSFetchRequest<TodoListItem> = TodoListItem.fetchRequest()
        
        let whereIsCompletedFalse = NSPredicate(format: "isCompleted == %@", false)
        request.predicate = whereIsCompletedFalse
        
        do {
            let result = try context?.fetch(request)
            return result ?? []
        } catch {
            return []
        }
    }
    
    func getCompeltedTodo() -> [TodoListItem] {
        let request: NSFetchRequest<TodoListItem> = TodoListItem.fetchRequest()
        
        let whereIsCompleted = NSPredicate(format: "isCompleted == %d", true)
        request.predicate = whereIsCompleted
        
        do {
            let result = try context?.fetch(request)
            return result ?? []
        } catch {
            return []
        }
    }
}
