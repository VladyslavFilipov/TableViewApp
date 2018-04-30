//
//  QueueCM.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 27.04.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

class QueueManager: ControlManagerProtocol {
    
    var visualizationTableData: VisualizationTableDataProtocol?
    
    func set(delegate: VisualizationTableDataProtocol) {
        self.visualizationTableData = delegate
    }
    
    private func add() {
        guard let tableData = visualizationTableData else { return }
        tableData.add(index: 0, value: "0", status: .highlighted)
        changeStatus((0,0))
        if tableData.DataSructureModelArray.count > 1 {
            changeStatus((0, tableData.DataSructureModelArray.count - 1))
        }
    }
    
    private func delete() {
        guard let tableData = visualizationTableData else { return }
        let index = tableData.DataSructureModelArray.count - 1
        if tableData.DataSructureModelArray.indices.contains(index) {
            tableData.delete(index: index)
        } else {
            tableData.delete(index: 0)
        }
        if tableData.DataSructureModelArray.count > 0 {
            changeStatus((0,index - 1))
        }
    }
    
    private func changeStatus(_ indeces: (Int, Int)) {
        guard var tableData = visualizationTableData else { return }
        for index in 0..<tableData.DataSructureModelArray.count {
            tableData.DataSructureModelArray[index].status = .common
        }
        tableData.DataSructureModelArray[indeces.0].status = .highlighted
        tableData.DataSructureModelArray[indeces.1].status = .highlighted
        tableData.updateTable()
    }
    
    func createMenu() -> [MenuType] {
        var arrayButtons: Array<MenuType> = []
        arrayButtons.append(MenuType.button(title: "+") {
            self.add()
        })
        arrayButtons.append(MenuType.button(title: "-") {
            self.delete()
        })
        return arrayButtons
    }
}
