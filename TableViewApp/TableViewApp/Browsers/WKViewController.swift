//
//  WKViewViewController.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 20.04.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import UIKit
import WebKit

class WKViewController: UIViewController, WKUIDelegate, UIScrollViewDelegate, BrowserProtocol {
    var linkOnWiki: URL?

    @IBOutlet weak var browserWKView: WKWebView!
    @IBOutlet weak var browserToolBar: UIToolbar!
    
    var lastOffsetY :CGFloat = 0
    
    override func viewWillAppear(_ animated: Bool) {
        browserWKView.scrollView.delegate = self
        guard let url = linkOnWiki else { return }
        let request = URLRequest(url: url)
        browserWKView.load(request)
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
