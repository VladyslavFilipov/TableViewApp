//
//  DictionaryModel.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 03.05.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

struct DictionaryModel {
    
    var delegate: VisualizationTableDataProtocol?
    
    var dataArray: [CellDataModel] = []
    
    mutating func add(_ model: CellDataModel) -> Bool {
        if !dataArray.contains(model) {
            dataArray.insert(model, at: 0)
            updateValues(model)
            return true
        } else {
            guard let index = dataArray.index(of: model) else { return false }
            dataArray[index].value = model.value
            return false
        }
    }
    
    mutating func contains(_ model: CellDataModel) -> Bool {
        if dataArray.contains(model) {
            return true
        }
        return false
    }
    
    mutating func delete(_ model: CellDataModel) -> Int {
        let index = dataArray.index(of: model)
        dataArray.remove(at: index!)
        if dataArray.count > 0 {
            updateValues(model)
        }
        return index!
    }
    
    mutating func updateValues(_ model: CellDataModel) {
        for index in 0..<dataArray.count {
            dataArray[index].status = .common
            if dataArray[index].key == model.key {
                dataArray[index].status = .highlighted
            }
        }
    }
}
