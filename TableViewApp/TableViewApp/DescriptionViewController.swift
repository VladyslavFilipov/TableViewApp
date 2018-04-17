//
//  ViewController.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 12.04.18.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {

    @IBOutlet weak var descriptionViewControllerLabel: UILabel!
    @IBOutlet weak var descriptionViewControllerNavigationBar: UINavigationItem!
    
    var cellEntity = DataStructureModel(title: "")
    
    override func viewWillAppear(_ animated: Bool) {
        descriptionViewControllerNavigationBar.title = cellEntity.getTitle()
        descriptionViewControllerLabel.text = cellEntity.getDescr()
    }
}
