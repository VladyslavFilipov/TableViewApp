//
//  StackCM.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 27.04.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

class StackManager: ControlManagerProtocol {
    
    var visualizationTableData: VisualizationTableDataProtocol?
    
    func set(delegate: VisualizationTableDataProtocol) {
        self.visualizationTableData = delegate
    }
    
    private func add() {
        guard let tableData = visualizationTableData else { return }
        let index = tableData.DataSructureModelArray.count - 1
        if tableData.DataSructureModelArray.indices.contains(index) {
            guard let number = Int(tableData.DataSructureModelArray[0].value) else { return }
            tableData.add(index: 0, value: String(number + 1), status: .highlighted)
        } else {
            tableData.add(index: 0, value: "0", status: .highlighted)
        }
    }
    
    private func delete() {
        guard let tableData = visualizationTableData else { return }
        tableData.delete(index: 0)
    }
    
    func createMenu() -> [MenuType] {
        var arrayButtons: Array<MenuType> = []
        arrayButtons.append(MenuType.button(title: "+") {
            self.add()
        })
        arrayButtons.append(MenuType.button(title: "-") {
            self.delete()
        })
        return arrayButtons
    }
}
