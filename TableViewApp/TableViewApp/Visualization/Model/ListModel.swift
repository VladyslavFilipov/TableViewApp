//
//  ListModel.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 03.05.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

struct ListModel {
    
    var dataArray: [CellDataModel] = []
    var index = 0
    
    mutating func add(_ model: CellDataModel, _ index: Int?) -> Bool {
        guard let index = index else { return false }
        if dataArray.count <= index {
            dataArray.insert(model, at: index)
            return true
        } else {
            dataArray[index].value = model.value
        }
        return false
    }
    
    func canBeRemoved(_ index: Int?) -> Bool {
        guard let index = index else { return false }
        if dataArray.count > index && dataArray.count > 0 { return true }
        return false
    }
    
    mutating func delete(_ index: Int?) -> Int {
        dataArray.remove(at: index!)
        return index!
    }
    
    mutating func updateValues(_ index: Int, _ highlight: Int?) -> Status {
        dataArray[index].status = .common
        guard let highlight = highlight else { return .common }
        if highlight >= dataArray.count { return .common }
        dataArray[highlight].status = .highlighted
        return dataArray[index].status
    }
}
