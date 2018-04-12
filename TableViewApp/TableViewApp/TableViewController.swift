//
//  TableViewController.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 12.04.18.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let dataStructArray = ["Stack", "Queue", "Set", "Dequeue", "Priority Queue", "List(Array)", "MultiSet", "Dictionary"]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataStructArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstTypeCell", for: indexPath) as! TableViewCell
        
        let row = indexPath.row
        let dataStruct = dataStructArray[row]
        cell.firstTypeCellLabel?.text = dataStruct
        
        return cell
    }
}
