//
//  StackModel.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 03.05.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

struct StackModel {
    
    var delegate: VisualizationTableDataProtocol?
    
    var dataArray: [CellDataModel] = []
    
    mutating func add(_ model: CellDataModel) -> Bool {
        dataArray.append(model)
        return true
    }
    
    mutating func delete() -> Bool {
        if dataArray.count > 0 {
            dataArray.remove(at: 0)
            return true
        }
        return false
    }
    
    mutating func updateValues(_ index: Int) -> Status {
        dataArray[index].status = .common
        dataArray[0].status = .highlighted
        return dataArray[index].status
    }
}
