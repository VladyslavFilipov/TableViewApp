//
//  CustomButton.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 27.04.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    
    var action: ( ()->() )?
    
    init(title: String, action: ( ()->() )? = nil) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.setTitleColor(.blue, for: .normal)
        self.action = action
        self.addTarget(self, action: #selector(getAction), for: .touchUpInside)
        self.heightAnchor.constraint(equalToConstant: 64).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func getAction() {
        action?()
    }
}
