//
//  CustomSwitch.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 30.04.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation
import UIKit

class CustomSwitch: UISwitch {
    
    var action: ( (Bool)->() )?
    
    init(action: ( (Bool)->() )? = nil) {
        super.init(frame: .zero)
        self.action = action
        self.addTarget(self, action: #selector(getAction(_:)), for: .valueChanged)
        self.isOn = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func getAction(_ sender: UISwitch) {
        action?(sender.isOn)
    }
}
