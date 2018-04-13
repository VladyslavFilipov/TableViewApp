//
//  ViewController.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 12.04.18.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cellTextViewLabel: UILabel!
    
    var cellText = String()
    
    override func viewWillAppear(_ animated: Bool) {
        cellTextViewLabel.text = cellText
    }
}
