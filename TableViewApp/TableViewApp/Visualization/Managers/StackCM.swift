//
//  StackCM.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 27.04.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

class StackManager: ControlManagerProtocol {
    
    var delegate: VisualizationTableDataProtocol?
    var model = StackModel()
    
    private func add() {
        guard let tableData = delegate else { return }
        let value = String(model.dataArray.count)
        let element = CellDataModel(value, .highlighted)
        if model.add(element) {
            tableData.add(index: 0, value: element.defaultText, status: element.status)
        }
        changeStatus()
    }
    
    private func delete() {
        guard let tableData = delegate else { return }
        if model.delete() {
            tableData.delete(index: 0)
        }
        if model.dataArray.count > 0 {
            changeStatus()
        }
    }
    
    private func changeStatus() {
        guard var tableData = delegate else { return }
        for index in 0..<model.dataArray.count {
            tableData.array[index].status = model.updateValues(index)
        }
        tableData.updateTable()
    }
    
    func createMenu() -> [MenuType] {
        var arrayButtons: Array<MenuType> = []
        arrayButtons.append(MenuType.button(title: "+") { self.add() })
        arrayButtons.append(MenuType.button(title: "-") { self.delete() })
        return arrayButtons
    }
}
