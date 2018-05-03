//
//  DequeueCM.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 30.04.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

class DequeueManager: ControlManagerProtocol {
    
    var delegate: VisualizationTableDataProtocol?
    var model = DequeueModel()
    var itsChanged = true
    
    private func add() {
        guard let tableData = delegate else { return }
        let value = String(model.dataArray.count)
        let element = CellDataModel(value, .highlighted)
        model.changeState(itsChanged)
        if model.add(element) {
            tableData.add(index: model.indeces.0, value: element.defaultText, status: element.status)
        }
        changeStatus(model.indeces.0)
    }
    
    private func delete() {
        guard let tableData = delegate else { return }
        model.changeState(itsChanged)
        if model.canBeRemoved() {
            changeStatus(model.indeces.1)
            model.delete()
            tableData.delete(index: model.indeces.1)
        }
    }
    
    private func changeStatus(_ highlight: Int) {
        guard var tableData = delegate else { return }
        for index in 0..<model.dataArray.count {
            tableData.array[index].status = model.updateValues(index, highlight)
        }
        tableData.updateTable()
    }
    
    private func changeState(_ isItOn: Bool = true) {
        itsChanged = isItOn
    }
    
    func createMenu() -> [MenuType] {
        var arrayComtrolls: [MenuType] = []
        arrayComtrolls.append(MenuType.button(title: "+") { self.add() })
        arrayComtrolls.append(MenuType.button(title: "-") { self.delete() })
        arrayComtrolls.append(MenuType.stateSwitch( action: changeState(_:)))
        return arrayComtrolls
    }
}
