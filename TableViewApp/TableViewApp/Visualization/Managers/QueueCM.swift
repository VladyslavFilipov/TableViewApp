//
//  QueueCM.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 27.04.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

class QueueManager: ControlManagerProtocol {
    
    var delegate: VisualizationTableDataProtocol?
    var model = QueueModel()
    
    private func add() {
        guard let tableData = delegate else { return }
        let value = String(model.dataArray.count)
        let element = CellDataModel(value, .highlighted)
        if model.add(element) {
            tableData.add(index: 0, value: element.defaultText, status: element.status)
        }
        changeStatus(0)
    }
    
    private func delete() {
        guard let tableData = delegate else { return }
        if model.canBeRemoved() {
            changeStatus(model.dataArray.count - 1)
            model.delete()
            tableData.delete(index: model.dataArray.count)
        }
    }
    
    private func changeStatus(_ highlight: Int) {
        guard var tableData = delegate else { return }
        for index in 0..<model.dataArray.count {
            tableData.array[index].status = model.updateValues(index, highlight)
        }
        tableData.updateValuesAndColorWithFading(true)
    }
    
    func createMenu() -> [MenuType] {
        var arrayButtons: [MenuType] = []
        arrayButtons.append(MenuType.button(title: "+") { self.add() })
        arrayButtons.append(MenuType.button(title: "-") { self.delete() })
        return arrayButtons
    }
}
