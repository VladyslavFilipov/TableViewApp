//
//  DequeueModel.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 03.05.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

struct DequeueModel {
    
    var dataArray: [CellDataModel] = []
    var indeces: (Int, Int) = (0,0)
    
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
    
    mutating func changeState(_ itsChanged: Bool) {
        if itsChanged {
            indeces = (0 ,dataArray.count - 1)
        } else {
            indeces = (dataArray.count, 0)
        }
    }
    
    mutating func updateValues(_ index: Int, _ highlight: Int) -> Status {
        dataArray[index].status = .common
        dataArray[highlight].status = .highlighted
        return dataArray[index].status
    }
}
