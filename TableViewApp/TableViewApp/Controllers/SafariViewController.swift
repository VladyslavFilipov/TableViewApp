//
//  SFSafariViewController.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 20.04.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import UIKit
import SafariServices

class SafariViewController: UIViewController, SFSafariViewControllerDelegate {

    var entity = DataStructureModel(title: "1", deskr: "1", link: "http://4pda.ru")
    var isItDone = false
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let myURL = entity.getLink() 
        
        let controller = SFSafariViewController(url: myURL)
        controller.delegate = self
        
        if isItDone {
            dismiss(animated: false, completion: nil)
        } else {
            self.present(controller, animated: false)
        }
    }
    
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        isItDone = true
    }
}
