//
//  PriorityQueueCM.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 30.04.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

class PriorityQueueManager: ControlManagerProtocol {
    
    var textFieldText = ""
    
    var delegate: VisualizationTableDataProtocol?
    var model = PriorityQueueModel()
    
    private func add() {
        guard let tableData = delegate else { return }
        let priority = Int(textFieldText) ?? 1
        let value = String(model.dataArray.count)
        let element = CellDataModel(value, .highlighted, priority)
        if model.add(element) {
            tableData.add(index: model.dataArray.index(of: element)!, value: element.priorityText, status: element.status)
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
        tableData.updateTable()
    }
    
    private func updateValues() {
        guard var tableData = delegate else { return }
        for index in 0..<model.dataArray.count {
            tableData.array[index].text = model.dataArray[index].priorityText
        }
    }
    
    private func textFieldDidChange(_ textFieldValue: String) {
        textFieldText = textFieldValue
    }
    
    func createMenu() -> [MenuType] {
        var arrayControllers: [MenuType] = []
        arrayControllers.append(MenuType.button(title: "+") { self.add() })
        arrayControllers.append(MenuType.button(title: "-") { self.delete() })
        arrayControllers.append(MenuType.textField(placeholder: "Enter priority of a cell", keyboard: .decimalPad, action: textFieldDidChange))
        return arrayControllers
    }
}
