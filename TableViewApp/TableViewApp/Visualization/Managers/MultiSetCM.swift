//
//  MultiSetCM.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 30.04.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

class MultiSetManager: ControlManagerProtocol {
    
    var textFieldText: String?
    
    var delegate: VisualizationTableDataProtocol?
    var model = MultiSetModel()
    
    private func add() {
        guard let tableData = delegate else { return }
        guard let value = textFieldText else { return }
        if value == "" { return }
        let element = CellDataModel(value, .highlighted)
        if model.add(element) {
            tableData.add(index: 0, value: element.repiatText, status: element.status)
        }
        changeStatus(model.dataArray.index(of: element))
    }
    
    private func delete() {
        guard let tableData = delegate else { return }
        guard let text = textFieldText else { return }
        let element = CellDataModel(text, .highlighted)
        if model.canBeRemoved(element) {
            changeStatus(model.dataArray.index(of: element))
            tableData.delete(index: model.delete(element))
        }
        changeStatus(model.dataArray.index(of: element))
    }
    
    private func changeStatus(_ highlight: Int?) {
        guard var tableData = delegate else { return }
        for index in 0..<model.dataArray.count {
            tableData.array[index].status = model.updateValues(index, highlight)
            tableData.array[index].text = model.dataArray[index].repiatText
        }
        tableData.updateValuesAndColorWithFading(false)
    }
    
    private func textFieldDidChange(_ textFieldValue: String) {
        textFieldText = textFieldValue
        guard let text = textFieldText else { return }
        let element = CellDataModel(text, .highlighted)
        if model.dataArray.count > 0 {
            changeStatus(model.dataArray.index(of: element))
        }
    }
    
    func createMenu() -> [MenuType] {
        var arrayControllers: [MenuType] = []
        arrayControllers.append(MenuType.button(title: "+") { self.add() })
        arrayControllers.append(MenuType.button(title: "-") { self.delete() })
        arrayControllers.append(MenuType.textField(placeholder: "Enter value", keyboard: .default, action: textFieldDidChange))
        return arrayControllers
    }
}
