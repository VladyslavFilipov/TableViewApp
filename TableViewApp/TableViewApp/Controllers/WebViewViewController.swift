//
//  WedViewViewController.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 20.04.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import UIKit

class WebViewViewController: UIViewController {
    
    var url = URL(string: "https://developer.apple.com")
    var navigationTitle = "title"

    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var browserWebView: UIWebView!
    
    override func viewWillAppear(_ animated: Bool) {
        let request = URLRequest(url: url!)
        browserWebView.loadRequest(request)
        navigationBar.topItem?.title = navigationTitle
    }
    
    @IBAction func CencelButtonPressed(_ sender: Any) {
        
    }
}
