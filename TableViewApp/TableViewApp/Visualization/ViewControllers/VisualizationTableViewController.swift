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
    var array: [(text: String, status: Status)] = []
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func add(index: Int, value: String, status: Status) {
        array.insert((value, status), at: index)
        tableView.insertRows(at: [IndexPath(row: index, section: 0)], with: .right)
        updateTable()
    }
    
    func delete(index: Int) {
        if !array.indices.contains(index) { return
        } else {
            array.remove(at: index)
            tableView.deleteRows(at: [IndexPath(row: index, section: 0)], with: .left)
        }
        updateTable()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "visualizationCell", for: indexPath) as? VisualizationTableViewCell else { return UITableViewCell() }
        cell.setTitle(array[indexPath.row].text)
        print(array)
        return cell
    }
    
    func updateTable() {
        for index in 0..<array.count {
            guard let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0)) as? VisualizationTableViewCell else { return }
            cell.setTitle(array[index].text)
            if array[index].status == .highlighted {
                tableView.cellForRow(at: IndexPath(row: index, section: 0))?.setColor(.red)
            } else if array[index].status == .common {
                tableView.cellForRow(at: IndexPath(row: index, section: 0))?.setColor(.green)
            }
        }
    }
}
