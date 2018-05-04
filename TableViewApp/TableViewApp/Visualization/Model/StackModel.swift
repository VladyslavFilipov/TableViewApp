//
//  StackModel.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 03.05.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

struct StackModel {
    
    var dataArray: [CellDataModel] = []
    
    mutating func add(_ model: CellDataModel) -> Bool {
        dataArray.append(model)
        return true
    }
    
    func canBeRemoved() -> Bool {
        if dataArray.count > 0 { return true }
        return false
    }
    
    mutating func delete() {
        dataArray.removeFirst()
    }
    
    mutating func updateValues(_ index: Int, _ highlight: Int?) -> Status {
        dataArray[index].status = .common
        guard let highlight = highlight else { return .common }
        dataArray[highlight].status = .highlighted
        return dataArray[index].status
    }
}
