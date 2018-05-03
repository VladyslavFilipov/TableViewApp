//
//  Extensions.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 27.04.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func performSegueToReturnBack()  {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
}

extension UITextField {
    func setPlaceholder(_ placeholder: String) {
        self.placeholder = placeholder
    }
}

extension UIView {
    func createOpacityGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor, UIColor.black.cgColor, UIColor.black.cgColor]
        gradient.locations = [0, 1]
        self.layer.mask = gradient
    }
    
    func setBackgroundColor(_ color: UIColor) {
        self.backgroundColor = color
    }
}

extension UITableView {
    func addCell(_ indexPath: IndexPath) {
        self.beginUpdates()
        self.insertRows(at: [indexPath], with: .right)
        self.endUpdates()
    }
    
    func deleteCell(_ indexPath: IndexPath) {
        self.beginUpdates()
        self.deleteRows(at: [indexPath], with: .left)
        self.endUpdates()
    }
}

extension UITableViewCell {
    func setColor(_ color: UIColor) {
        self.contentView.backgroundColor = color
    }
}

extension UIButton {
    func setTitle(_ title: String) {
        self.setTitle(title, for: .normal)
    }
    
    func setTitleColor(_ color: UIColor) {
        self.setTitleColor(color, for: .normal)
    }
    
    func customizeWith(name title: String) -> UIButton {
        self.backgroundColor = UIColor.white
        self.setTitle(title)
        self.setTitleColor(UIColor.blue)
        return self
    }
}

extension CellDataModel: Equatable {

    static func ==(lhs: CellDataModel, rhs: CellDataModel) -> Bool {
        let areEqual = (lhs.value == rhs.value) || (((lhs.value != rhs.value) && (lhs.key == rhs.key)) || ((lhs.value == rhs.value) && (lhs.key == rhs.key)))
        return areEqual
    }
    
    static func <(lhs: CellDataModel, rhs: CellDataModel) -> Bool {
        let isSmaller = lhs.priority < rhs.priority
        return isSmaller
    }
    
    static func >(lhs: CellDataModel, rhs: CellDataModel) -> Bool {
        let isBigger = lhs.priority > rhs.priority
        return isBigger
    }
}

