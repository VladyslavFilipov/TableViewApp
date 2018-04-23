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
    var pidor = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        guard let myURL = entity.getLink() else {
            print("Error url")
            return
        }
        print(myURL)
        
        let controller = SFSafariViewController(url: myURL)
        controller.delegate = self
        
        if pidor {
            dismiss(animated: true, completion: nil)
        } else {
            self.present(controller, animated: true)
        }
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        pidor = true
    }
    
//    func safariViewController(_ controller: SFSafariViewController, didCompleteInitialLoad didLoadSuccessfully: Bool) {
//        print("fuck")
//    }
//
//    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
//        dismiss(animated: true, completion: { self.performSegueToReturnBack() })
//    }
//
//    @IBAction func cancelButtonPressed(_ sender: Any) {
//        performSegueToReturnBack()
//    }
}
