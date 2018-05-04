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
        guard let value = textFieldText else { return }
        guard let key = textFieldKey else { return }
        if value == "" { return }
        let element = CellDataModel(value, key)
        if model.add(element) {
            tableData.add(index: 0, value: element.dictionaryText, status: element.status)
        }
        changeStatus(setUpIndex())
    }
    
    private func delete() {
        guard let tableData = delegate else { return }
        guard let value = textFieldText else { return }
        if model.contains(CellDataModel(value, textFieldKey)) {
            tableData.delete(index: model.delete(CellDataModel(value, textFieldKey)))
        }
    }
    
    private func textFieldTextDidChange(_ textFieldValue: String) {
        textFieldText = textFieldValue
    }
    
    private func textFieldKeyDidChange(_ textFieldValue: String) {
        textFieldKey = textFieldValue
        if model.dataArray.count > 0 {
            changeStatus(setUpIndex())
        }
    }
    
    private func changeStatus(_ highlight: Int?) {
        guard var tableData = delegate else { return }
        if model.dataArray.count > 0 {
            for index in 0..<model.dataArray.count {
                tableData.array[index].status = model.updateValues(index, highlight)
                tableData.array[index].text = model.dataArray[index].dictionaryText
            }
        }
        tableData.updateTable()
    }
    
    private func setUpIndex() -> Int? {
        guard let key = textFieldKey else { return nil }
        guard let value = textFieldText else { return nil }
        if model.dataArray.contains(CellDataModel(value, key)) { return model.dataArray.index(of: CellDataModel(value, key)) }
        return nil
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

