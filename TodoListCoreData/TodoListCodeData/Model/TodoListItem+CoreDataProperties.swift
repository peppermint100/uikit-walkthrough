//
//  TodoListItem+CoreDataProperties.swift
//  TodoListCodeData
//
//  Created by peppermint100 on 2023/06/15.
//
//

import Foundation
import CoreData


extension TodoListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoListItem> {
        return NSFetchRequest<TodoListItem>(entityName: "TodoListItem")
    }

    @NSManaged public var createdAt: Date?
    @NSManaged public var name: String?
    @NSManaged public var isCompleted: Bool

}

extension TodoListItem : Identifiable {

}
