//
//  QueueModel.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 03.05.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

struct QueueModel {
    
    var dataArray: [CellDataModel] = []
    
    mutating func add(_ model: CellDataModel) -> Bool {
        dataArray.insert(model, at: 0)
        return true
    }
    
    func canBeRemoved() -> Bool {
        if dataArray.count > 0 {
            return true
        }
        return false
    }
    
    mutating func delete() {
        dataArray.removeLast()
    }
    
    
    mutating func updateValues(_ index: Int, _ highlight: Int) -> Status {
        dataArray[index].status = .common
        dataArray[highlight].status = .highlighted
        return dataArray[index].status
    }
}
