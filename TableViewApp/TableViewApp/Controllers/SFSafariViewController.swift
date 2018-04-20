//
//  SFSafariViewController.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 20.04.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import UIKit

class SFSafariViewController: UIViewController {

    var url = URL(string: "https://developer.apple.com")
    
    override func viewWillAppear(_ animated: Bool) {
        let request = URLRequest(url: url!)
        //browserWebView.loadRequest(request)
    }

}
