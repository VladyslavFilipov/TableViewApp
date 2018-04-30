//
//  VizualizationTableViewController.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 24.04.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import UIKit

class VisualizationTableViewController: UITableViewController, VisualizationTableDataProtocol {
    
    var DataSructureModelArray: [CellDataModel] = []
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataSructureModelArray.count
    }
    
    func add(index: Int, value: String, status: Status) {
        DataSructureModelArray.insert(CellDataModel(value, status), at: index)
        tableView.insertRows(at: [IndexPath(row: index, section: 0)], with: .right)
        updateTable()
    }
    
    func delete(index: Int) {
        if !DataSructureModelArray.indices.contains(index) {
            return
        } else {
            DataSructureModelArray.remove(at: index)
            tableView.deleteRows(at: [IndexPath(row: index, section: 0)], with: .left)
        }
        updateTable()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "visualizationCell", for: indexPath) as? VisualizationTableViewCell else { return UITableViewCell() }
            cell.setTitle(DataSructureModelArray[indexPath.row].value)
        return cell
    }
    
    func updateTable() {
        for index in 0..<DataSructureModelArray.count {
            guard let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0)) as? VisualizationTableViewCell else { return }
            if DataSructureModelArray[index].helperValue == 1 {
                cell.setTitle(DataSructureModelArray[index].value)
            } else {
                guard let repiats = DataSructureModelArray[index].helperValue else { return }
                cell.setTitle(DataSructureModelArray[index].value + " - " + String(repiats) + " times")
            }
            if DataSructureModelArray[index].status == .highlighted {
                tableView.cellForRow(at: IndexPath(row: index, section: 0))?.setColor(.red)
            } else if DataSructureModelArray[index].status == .common {
                tableView.cellForRow(at: IndexPath(row: index, section: 0))?.setColor(.green)
            }
        }
    }
}
