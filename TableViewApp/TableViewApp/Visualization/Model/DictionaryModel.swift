//
//  DictionaryModel.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 03.05.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

struct DictionaryModel {
    
    var dataArray: [CellDataModel] = []
    
    mutating func add(_ model: CellDataModel) -> Bool {
        if !dataArray.contains(model) {
            dataArray.insert(model, at: 0)
            return true
        } else {
            guard let index = dataArray.index(of: model) else { return false }
            dataArray[index].value = model.value
            return false
        }
    }
    
    mutating func contains(_ model: CellDataModel) -> Bool {
        if dataArray.contains(model) { return true }
        return false
    }
    
    mutating func delete(_ model: CellDataModel) -> Int {
        let index = dataArray.index(of: model)
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
