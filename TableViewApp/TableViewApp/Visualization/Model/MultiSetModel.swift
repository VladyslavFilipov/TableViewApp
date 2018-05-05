//
//  MultiSetModel.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 03.05.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

struct MultiSetModel {
    
    var dataArray: [CellDataModel] = []
    var index = 0
    
    mutating func add(_ model: CellDataModel) -> Bool {
        if !dataArray.contains(model) {
            dataArray.insert(model, at: 0)
            return true
        } else {
            let index = dataArray.index(of: model)!
            dataArray[index].repiats += 1
            print(dataArray[index])
        }
        return false
    }
    
    mutating func canBeRemoved(_ model: CellDataModel) -> Bool {
        if dataArray.count > 0 && dataArray.contains(model) {
            let index = dataArray.index(of: model) ?? 0
            if dataArray[index].repiats > 1 {
                dataArray[index].repiats -= 1
                return false
            }
            return true
        }
        return false
    }
    
    mutating func delete(_ model: CellDataModel) -> Int {
        let index = dataArray.index(of: model) ?? 0
        dataArray.remove(at: index)
        return index
    }
    
    mutating func updateValues(_ index: Int, _ highlight: Int?) -> Status {
        dataArray[index].status = .common
        guard let highlight = highlight else { return .common }
        dataArray[highlight].status = .highlighted
        return dataArray[index].status
    }
}
