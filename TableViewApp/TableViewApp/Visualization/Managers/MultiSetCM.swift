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
    
    var delegate: VisualizationTableDataProtocol?
    
    private func add() {
//        guard var tableData = delegate else { return }
//        if tableData.DataSructureModelArray.count == 0 && !textFieldText.isEmpty {
//            tableData.add(index: tableData.DataSructureModelArray.count, value: textFieldText, status: .highlighted)
//        } else if tableData.DataSructureModelArray.count > 0 {
////            if  !tableData.DataSructureModelArray.contains(CellDataModel(textFieldText)) {
////                tableData.add(index: tableData.DataSructureModelArray.count, value: textFieldText, status: .highlighted)
////            } else {
////                guard let index = tableData.DataSructureModelArray.index(of: CellDataModel(textFieldText)) else { return }
////                let repiat = tableData.DataSructureModelArray[index].repiats
////                tableData.DataSructureModelArray[index].repiats = repiat + 1
//            }
//        }
////        guard let index = tableData.DataSructureModelArray.index(of: CellDataModel(textFieldText)) else { return }
//        changeStatus(index)
//        tableData.updateTable()
    }
    
    private func delete() {
//        guard var tableData = delegate else { return }
////        guard let index = tableData.DataSructureModelArray.index(of: CellDataModel(textFieldText)) else { return }
////        if tableData.DataSructureModelArray.count > 0 && tableData.DataSructureModelArray[index].repiats == 1 {
////            if  tableData.DataSructureModelArray.contains(CellDataModel(textFieldText)) {
//                tableData.delete(index: index)
//            }
//        } else if tableData.DataSructureModelArray.count > 0 {
//            let repiat = tableData.DataSructureModelArray[index].repiats
//            tableData.DataSructureModelArray[index].repiats = repiat - 1
//            changeStatus(index)
//        }
//        tableData.updateTable()
    }
    
    private func textFieldDidChange(_ textFieldValue: String) {
        guard var tableData = delegate else { return }
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
        guard var tableData = delegate else { return }
        for index in 0..<tableData.DataSructureModelArray.count {
            tableData.DataSructureModelArray[index].status = .common
            let value = tableData.DataSructureModelArray[index].value
            let repiat = tableData.DataSructureModelArray[index].repiats
//            if repiat > 1 {
//                tableData.DataSructureModelArray[index].text = value + "\t - \(repiat) repiats"
//            } else {
//                tableData.DataSructureModelArray[index].text = value
//            }
        }
        tableData.DataSructureModelArray[index].status = .highlighted
    }
    
    func createMenu() -> [MenuType] {
        var arrayControllers: [MenuType] = []
        arrayControllers.append(MenuType.button(title: "+") { self.add() })
        arrayControllers.append(MenuType.button(title: "-") { self.delete() })
        arrayControllers.append(MenuType.textField(placeholder: "Enter value", keyboard: .default, action: textFieldDidChange))
        return arrayControllers
    }
}
