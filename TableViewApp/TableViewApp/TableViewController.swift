//
//  TableViewController.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 12.04.18.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let model = ModelData()
    let cellModel = CellModel()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.separatorColor = UIColor.black
        return model.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FirstTypeCell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        cellModel.configure(model.get(at: indexPath.row), cell.firstTypeCellLabel)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromCellToViewController" {
            let destination = segue.destination as! ViewController
            guard let cellIndex = tableView.indexPathForSelectedRow?.row else { return }
            destination.cellText = model.get(at: cellIndex)
        }
    }
}
