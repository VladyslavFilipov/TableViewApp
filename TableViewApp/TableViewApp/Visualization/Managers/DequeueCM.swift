//
//  DequeueCM.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 30.04.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

class DequeueManager: ControlManagerProtocol {
    
    var visualizationTableData: VisualizationTableDataProtocol?
    
    func set(delegate: VisualizationTableDataProtocol) {
        self.visualizationTableData = delegate
    }
    
    private func add() {
        guard let tableData = visualizationTableData else { return }
        tableData.add(index: 0, value: "0", status: .highlighted)
    }
    
    private func delete() {
        guard let tableData = visualizationTableData else { return }
        let index = tableData.DataSructureModelArray.count - 1
        if tableData.DataSructureModelArray.indices.contains(index) {
            tableData.delete(index: index)
        } else {
            tableData.delete(index: 0)
        }
    }
    
    func createMenu() -> [MenuType] {
        var arrayComtrolls: [MenuType] = []
        arrayComtrolls.append(MenuType.button(title: "+") {
            self.add()
        })
        arrayComtrolls.append(MenuType.label(title: "Begin"))
        arrayComtrolls.append(MenuType.stateSwitch())
        arrayComtrolls.append(MenuType.button(title: "-") {
            self.delete()
        })
        
        return arrayComtrolls
    }
}
