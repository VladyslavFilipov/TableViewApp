//
//  ListCM.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 30.04.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

class ListManager: ControlManagerProtocol {
    
    var textFieldText: String?
    var textFieldIndex: String?
    
    var delegate: VisualizationTableDataProtocol?
    var model = ListModel()
    
    private func add() {
        guard let tableData = delegate else { return }
        guard let text = textFieldText else { return }
        let index = setUpIndex()
        let element = CellDataModel(text, .highlighted)
        if model.add(element, index) {
            guard let index = index else { return }
            tableData.add(index: index, value: element.defaultText, status: element.status)
        }
        changeStatus(index)
    }
    
    private func delete() {
        guard let tableData = delegate else { return }
        let index = setUpIndex()
        if model.canBeRemoved(index) {
            changeStatus(index)
            tableData.delete(index: model.delete(index))
        }
        changeStatus(index)
    }
    
    private func changeStatus(_ highlight: Int?) {
        guard var tableData = delegate else { return }
        if model.dataArray.count > 0 {
            for index in 0..<model.dataArray.count {
                tableData.array[index].status = model.updateValues(index, highlight)
                tableData.array[index].text = model.dataArray[index].defaultText
            }
        }
        tableData.updateTable()
    }
    
    private func textFieldTextDidChange(_ textFieldValue: String) {
        textFieldText = textFieldValue
    }
    
    private func textFieldIndexDidChange(_ textFieldValue: String) {
        textFieldIndex = textFieldValue
        changeStatus(setUpIndex())
    }
    
    private func setUpIndex() -> Int? {
        guard let indexText = textFieldIndex else { return nil }
        guard let index = Int(indexText) else { return nil }
        if index > model.dataArray.count { return nil }
        return index
    }
    
    func createMenu() -> [MenuType] {
        var arrayControllers: [MenuType] = []
        arrayControllers.append(MenuType.button(title: "+") { self.add() })
        arrayControllers.append(MenuType.button(title: "-") { self.delete() })
        arrayControllers.append(MenuType.textField(placeholder: "Enter value", keyboard: .default, action: textFieldTextDidChange))
        arrayControllers.append(MenuType.textField(placeholder: "Enter index", keyboard: .decimalPad, action: textFieldIndexDidChange))
        return arrayControllers
    }
}
