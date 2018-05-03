//
//  DictionaryCM.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 30.04.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

class DictionaryManager: ControlManagerProtocol {
    
    var textFieldText: String?
    var textFieldKey: String?
    
    var delegate: VisualizationTableDataProtocol?
    var model = DictionaryModel()
    
    private func add() {
        guard let tableData = delegate else { return }
        guard let value = textFieldText else {return}
        let element = CellDataModel(value, textFieldKey)
        if model.add(element) {
            tableData.add(index: 0, value: element.dictionaryText, status: element.status)
        }
//        else {
//            model.dataArray[model.dataArray.count - 1].value = value
//            data.array[0].text = model.dataArray[model.dataArray.count - 1].text
//            data.updateTable()
//        }
        changeStatus(textFieldKey)
    }
    
    private func delete() {
        guard let tableData = delegate else { return }
        guard let value = textFieldText else { return }
        let key = textFieldKey
        if model.contains(CellDataModel(value, key)) {
            tableData.delete(index: model.delete(CellDataModel(value, key)))
        }
    }
    
    private func textFieldTextDidChange(_ textFieldValue: String) {
        textFieldText = textFieldValue
    }
    
    private func textFieldKeyDidChange(_ textFieldValue: String) {
        textFieldKey = textFieldValue
        if model.dataArray.count > 0 {
            changeStatus(textFieldKey)
        }
    }
    
    private func changeStatus(_ key: String?) {
        guard var tableData = delegate else { return }
        guard let value = textFieldText else { return }
        model.updateValues(CellDataModel(value, key))
        for index in 0..<model.dataArray.count {
            tableData.array[index].status = model.dataArray[index].status
        }
        tableData.updateTable()
    }
    
    func createMenu() -> [MenuType] {
        var arrayControllers: [MenuType] = []
        arrayControllers.append(MenuType.button(title: "+") { self.add() })
        arrayControllers.append(MenuType.button(title: "-") { self.delete() })
        arrayControllers.append(MenuType.textField(placeholder: "Enter value", keyboard: .default, action: textFieldTextDidChange))
        arrayControllers.append(MenuType.textField(placeholder: "Enter key", keyboard: .default, action: textFieldKeyDidChange))
        return arrayControllers
    }
}

