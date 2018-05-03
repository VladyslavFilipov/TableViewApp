//
//  CustomTextField.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 30.04.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import UIKit

class CustomTextField: UITextField, UITextFieldDelegate {
    
    var action: ( (String)->() )?
    
    init(placeholder: String, keyboard: UIKeyboardType, action: ( (String)->() )? = nil) {
        super.init(frame: .zero)
        self.setPlaceholder(placeholder)
        self.borderStyle = .roundedRect
        self.action = action
        self.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        self.heightAnchor.constraint(equalToConstant: 64).isActive = true
        self.keyboardType = keyboard
        self.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return }
        action?(text)
    }
}
