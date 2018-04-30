//
//  DequeueCM.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 30.04.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

class DequeueManager: ControlManagerProtocol {
    
    var isStateChanged = true
    var indeces = (0, 0)
    var visualizationTableData: VisualizationTableDataProtocol?
    
    func set(delegate: VisualizationTableDataProtocol) {
        self.visualizationTableData = delegate
    }
    
    private func add() {
        guard let tableData = visualizationTableData else { return }
        if isStateChanged {
            indeces.0 = 0
            indeces.1 = tableData.DataSructureModelArray.count
        } else {
            indeces.0 = tableData.DataSructureModelArray.count
            indeces.1 = 0
        }
        tableData.add(index: indeces.0, value: "0", status: .highlighted)
        changeStatus(indeces)
    }
    
    private func delete() {
        guard let tableData = visualizationTableData else { return }
        if isStateChanged {
            indeces.0 = 0
            indeces.1 = tableData.DataSructureModelArray.count - 1
            if tableData.DataSructureModelArray.count > 1 {
                changeStatus((indeces.0, indeces.1 - 1))
            }
        } else {
            indeces.0 = tableData.DataSructureModelArray.count - 1
            indeces.1 = 0
            if tableData.DataSructureModelArray.count > 1 {
                changeStatus((indeces.0, indeces.1 + 1))
            }
        }
        
        if tableData.DataSructureModelArray.indices.contains(indeces.1) {
            tableData.delete(index: indeces.1)
        } else {
            tableData.delete(index: 0)
        }
    }
    
    private func changeState(_ isItOn: Bool) {
        isStateChanged = isItOn
    }
    
    private func changeStatus(_ indeces: (Int, Int)) {
        guard var tableData = visualizationTableData else { return }
        for index in 0..<tableData.DataSructureModelArray.count {
            tableData.DataSructureModelArray[index].status = .common
        }
        tableData.DataSructureModelArray[indeces.0].status = .highlighted
        tableData.DataSructureModelArray[indeces.1].status = .highlighted
        tableData.updateTable()
    }
    
    func createMenu() -> [MenuType] {
        var arrayComtrolls: [MenuType] = []
        arrayComtrolls.append(MenuType.button(title: "+") { self.add() })
        arrayComtrolls.append(MenuType.button(title: "-") { self.delete() })
        arrayComtrolls.append(MenuType.stateSwitch( action: changeState(_:)))
        return arrayComtrolls
    }
}
