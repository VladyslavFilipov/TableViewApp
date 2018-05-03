//
//  CellModel.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 27.04.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

struct CellDataModel {
    
    var value: String
    var status: Status = .highlighted
    var repiats: Int = 1
    var priority: Int = 1
    var key: String? = nil
    
    init(_ value: String, _ status: Status = .highlighted, _ priority: Int = 1) {
        self.value = value
        self.status = status
        self.priority = priority
    }
    
    init(_ value: String, _ key: String? = nil) {
        self.value = value
        self.key = key
    }
}

extension CellDataModel {
    var defaultText: String { return value }
    var priorityText: String { return value + " priority - " + String(priority) }
    var repiatText: String { return value + " repiats - " + String(repiats) + " time(s)"}
    var dictionaryText: String { return value + " for key - " + key! }
}

