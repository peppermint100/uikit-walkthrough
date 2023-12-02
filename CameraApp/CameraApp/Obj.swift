//
//  Obj.swift
//  CameraApp
//
//  Created by peppermint100 on 10/26/23.
//

import Foundation

class Person: Hashable {
    var name: String?
    
    func hash(into hasher: inout Hasher) {
      hasher.combine(name)
    }
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name
    }
}
