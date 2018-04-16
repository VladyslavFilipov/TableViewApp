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
    @IBOutlet weak var LabelTaxtScrollView: UIScrollView!
    @IBOutlet weak var ViewControllerNavigationBar: UINavigationItem!
    
    var cellText = String()
    
    override func viewWillAppear(_ animated: Bool) {
        ViewControllerNavigationBar.title = cellText
        LabelTaxtScrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: cellTextViewLabel.bottomAnchor).isActive = true
    }
}
