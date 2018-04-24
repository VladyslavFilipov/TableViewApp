//
//  VizualizationViewController.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 24.04.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import UIKit

class VizualizationViewController: UIViewController, VizualizationProtocol {
    
    var dataStructureTitle: String?
    
    let tableViewController = VizualizationTableViewController()
    
    @IBOutlet weak var vizualizationNavigationBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vizualizationNavigationBar.topItem?.title = dataStructureTitle
        let buttonWidth = self.view.bounds.width
        let addButton = createButton(named: "+", withSelector: #selector(addButtonAction), 0, buttonWidth/3)
        let substractButton = createButton(named: "-", withSelector: #selector(substractButtonAction), buttonWidth * 2/3, buttonWidth/3)
        let saveButton = createButton(named: "Ok", withSelector: #selector(saveButtonAction), buttonWidth/3, buttonWidth/3)
        
        self.view.addSubview(addButton)
        self.view.addSubview(substractButton)
        self.view.addSubview(saveButton)
    }
    
    func createButton(named title: String, withSelector selector: Selector, _ xCoordinate: CGFloat, _ buttonWidth: CGFloat) -> UIButton {
        let button = UIButton(frame: CGRect(x: xCoordinate, y: 64, width: buttonWidth, height: 60))
        button.backgroundColor = UIColor.white
        button.setTitle(title)
        button.setTitleColor(UIColor.blue)
        button.addTarget(self, action: selector, for: .touchUpInside)
        return button
    }
    
    @objc func addButtonAction(sender: UIButton!) {
        tableViewController.numberOfCells += 1
        let indexPath = IndexPath(row: tableViewController.numberOfCells - 1, section: 0)
        
        tableViewController.addCell(indexPath)
        print("tapped")
    }
    
    @objc func substractButtonAction(sender: UIButton!) {
        print("also tapped")
    }
    
    @objc func saveButtonAction(sender: UIButton!) {
        print("ok")
    }
    
    @IBAction func CancelButtonPressed(_ sender: Any) {
        performSegueToReturnBack()
    }
}

extension VizualizationTableViewController {
    func addCell(_ indexPath: IndexPath) {
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
    }
}
