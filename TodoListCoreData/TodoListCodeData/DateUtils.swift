//
//  DateUtils.swift
//  TodoListCodeData
//
//  Created by peppermint100 on 2023/06/11.
//

import Foundation

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: self)
    }
}
