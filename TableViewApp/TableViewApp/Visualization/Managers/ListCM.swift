//
//  ListCM.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 30.04.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

class ListManager: ControlManagerProtocol {
    
    var textFieldText = ""
    var textFieldIndex = ""
    
    var delegate: VisualizationTableDataProtocol?
    
    private func add() {
//        guard var tableData = delegate else { return }
//        let index = Int(textFieldIndex) ?? 0
//        if !textFieldText.isEmpty && tableData.DataSructureModelArray.indices.contains(index) {
//            tableData.DataSructureModelArray[index].text = textFieldText
//            changeStatus(index)
//        } else if !textFieldText.isEmpty {
//            tableData.add(index: tableData.DataSructureModelArray.count, value: textFieldText, status: .highlighted)
//            changeStatus(tableData.DataSructureModelArray.count - 1)
//        }
//        tableData.updateTable()
    }
    
    private func delete() {
        guard var tableData = delegate else { return }
        let index = Int(textFieldIndex) ?? 0
        if tableData.DataSructureModelArray.indices.contains(index) && tableData.DataSructureModelArray.count > 0 {
            tableData.delete(index: index)
            changeStatus(index)
        }
        tableData.updateTable()
    }
    
    private func textFieldTextDidChange(_ textFieldValue: String) {
        textFieldText = textFieldValue
    }
    
    private func textFieldIndexDidChange(_ textFieldValue: String) {
        guard let tableData = delegate else { return }
        textFieldIndex = textFieldValue
        let index = Int(textFieldIndex) ?? 0
        changeStatus(index)
        tableData.updateTable()
    }
    
    private func changeStatus(_ index: Int) {
        guard var tableData = delegate else { return }
        for index in 0..<tableData.DataSructureModelArray.count {
            tableData.DataSructureModelArray[index].status = .common
        }
        let index = Int(textFieldIndex) ?? 0
        if tableData.DataSructureModelArray.count > 0 && tableData.DataSructureModelArray.indices.contains(index) {
            tableData.DataSructureModelArray[index].status = .highlighted
        }
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
