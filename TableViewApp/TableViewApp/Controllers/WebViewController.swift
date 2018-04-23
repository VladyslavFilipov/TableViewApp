//
//  WedViewViewController.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 20.04.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIScrollViewDelegate {
    
    var entity = DataStructureModel(title: "", deskr: "", link: "")

    @IBOutlet weak var browserToolBar: UIToolbar!
    @IBOutlet weak var browserWebView: UIWebView!
    
    var lastOffsetY :CGFloat = 0
    
    override func viewWillAppear(_ animated: Bool) {
        browserWebView.scrollView.delegate = self
        let request = URLRequest(url: entity.getLink())
        browserWebView.loadRequest(request)
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        performSegueToReturnBack()
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView){
        lastOffsetY = scrollView.contentOffset.y
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView){
        
        let hide = scrollView.contentOffset.y > self.lastOffsetY
        self.navigationController?.setNavigationBarHidden(hide, animated: true)
        self.browserToolBar.isHidden = hide
    }
}

extension UIViewController {
    func performSegueToReturnBack()  {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
