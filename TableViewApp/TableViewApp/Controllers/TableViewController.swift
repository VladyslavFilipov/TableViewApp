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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.separatorColor = UIColor.black
        return model.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FirstTypeCell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        let dataStructure = model.get(at: indexPath.row)
        cell.firstTypeCellLabel.text = dataStructure.getTitle()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let descrStoryboard = storyboard.instantiateViewController(withIdentifier: "DescriptionController") as? DescriptionViewController
            else {
                print("Error instantiate DescriptionController")
                return
        }
        descrStoryboard.cellEntity = model.get(at: indexPath.row)
        self.navigationController?.pushViewController(descrStoryboard, animated: true)
    }
}
