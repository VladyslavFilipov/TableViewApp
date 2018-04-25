//
//  VizualizationTableViewController.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 24.04.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import UIKit

class VizualizationTableViewController: UITableViewController {
    
    var numberOfCells = Int()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfCells
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "vizualizationCell", for: indexPath)

        return cell
    }
}
