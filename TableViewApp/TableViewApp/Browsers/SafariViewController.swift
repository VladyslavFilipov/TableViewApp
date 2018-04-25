//
//  SFSafariViewController.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 20.04.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import UIKit
import SafariServices

class SafariViewController: UIViewController, SFSafariViewControllerDelegate, BrowserProtocol {
    
    var linkOnWiki: URL?
    
    var itIsDone = false
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let myURL = linkOnWiki else { return }
        print(myURL)
        
        let controller = SFSafariViewController(url: myURL)
        controller.delegate = self
        
        if itIsDone {
            dismiss(animated: false, completion: nil)
        } else {
            self.present(controller, animated: false)
        }
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        itIsDone = true
    }
}
