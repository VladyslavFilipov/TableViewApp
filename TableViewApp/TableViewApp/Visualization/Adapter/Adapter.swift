//
//  Adapter.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 27.04.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation
import UIKit

class Adapter: AdapterProtocol {
    
    var array: [MenuType] = []
    
    func setUpControllers(by manager: ControlManagerProtocol, in view: UIStackView, and otherView: UIStackView?) {
        array = manager.createMenu()

        for item in array {
            
            switch item {
            case .button(let title, let action):
                view.addArrangedSubview(CustomButton(title: title, action: action))
            case .textField(let placeholder, let action):
                otherView?.addArrangedSubview(CustomTextField(placeholder: placeholder, action: action))
            case .stateSwitch(let action):
                view.addArrangedSubview(CustomSwitch(action: action))
            }
        }
    }
}
