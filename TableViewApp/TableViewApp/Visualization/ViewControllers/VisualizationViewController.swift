//
//  VizualizationViewController.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 24.04.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import UIKit

class VisualizationViewController: UIViewController, UITextFieldDelegate {
    
    var tableData: VisualizationTableDataProtocol?
    var controlManager: ControlManagerProtocol!
    var adapter: AdapterProtocol = Adapter()
    
    @IBOutlet weak var allControllersStackView: UIStackView!
    @IBOutlet weak var buttonsStackView: UIStackView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let vizualizationController = destination as? VisualizationTableViewController {
            tableData = vizualizationController
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let table = tableData else { return }
        controlManager.delegate = table
        adapter.setUpControllers(by: controlManager, in: buttonsStackView, and: allControllersStackView)
    }
}
