//
//  MultiSetCM.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 30.04.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

class MultiSetManager: ControlManagerProtocol {
    
    var textFieldText = ""
    var visualizationTableData: VisualizationTableDataProtocol?
    
    func set(delegate: VisualizationTableDataProtocol) {
        self.visualizationTableData = delegate
    }
    
    private func add() {
        guard var tableData = visualizationTableData else { return }
        if tableData.DataSructureModelArray.count == 0 && !textFieldText.isEmpty {
            tableData.add(index: tableData.DataSructureModelArray.count, value: textFieldText, status: .highlighted)
        } else if tableData.DataSructureModelArray.count > 0 {
            if  !tableData.DataSructureModelArray.contains(CellDataModel(textFieldText)) {
                tableData.add(index: tableData.DataSructureModelArray.count, value: textFieldText, status: .highlighted)
                changeStatus(tableData.DataSructureModelArray.count - 1)
            } else {
                guard let index = tableData.DataSructureModelArray.index(of: CellDataModel(textFieldText)) else { return }
                tableData.DataSructureModelArray[index].helperValue! += 1
            }
        }
        tableData.updateTable()
    }
    
    private func delete() {
        guard var tableData = visualizationTableData else { return }
        guard let index = tableData.DataSructureModelArray.index(of: CellDataModel(textFieldText)) else { return }
        if tableData.DataSructureModelArray.count > 0 && tableData.DataSructureModelArray[index].helperValue == 1 {
            if  tableData.DataSructureModelArray.contains(CellDataModel(textFieldText)) {
                tableData.delete(index: index)
            }
        } else if tableData.DataSructureModelArray.count > 0 {
            tableData.DataSructureModelArray[index].helperValue! -= 1
        }
        tableData.updateTable()
    }
    
    private func textFieldDidChange(_ textFieldValue: String) {
        guard var tableData = visualizationTableData else { return }
        textFieldText = textFieldValue
        for index in 0..<tableData.DataSructureModelArray.count {
            tableData.DataSructureModelArray[index].status = .common
            if tableData.DataSructureModelArray[index].value == textFieldText {
                tableData.DataSructureModelArray[index].status = .highlighted
            }
        }
        tableData.updateTable()
    }
    
    private func changeStatus(_ index: Int) {
        guard var tableData = visualizationTableData else { return }
        for index in 0..<tableData.DataSructureModelArray.count {
            tableData.DataSructureModelArray[index].status = .common
        }
        tableData.DataSructureModelArray[index].status = .highlighted
    }
    
    func createMenu() -> [MenuType] {
        var arrayControllers: [MenuType] = []
        arrayControllers.append(MenuType.button(title: "+") { self.add() })
        arrayControllers.append(MenuType.button(title: "-") { self.delete() })
        arrayControllers.append(MenuType.textField(placeholder: "enter value", action: textFieldDidChange))
        return arrayControllers
    }
}
