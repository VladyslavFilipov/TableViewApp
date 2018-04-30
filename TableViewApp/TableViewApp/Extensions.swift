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

extension VisualizationTableViewController {
    
    func createCell(_ indexPath: IndexPath, _ color: UIColor) {
        guard let cell = self.tableView.cellForRow(at: indexPath) as? VisualizationTableViewCell else { return }
        cell.contentView.setBackgroundColor(color)
    }
}

extension UITextField {
    func setPlaceholder(_ placeholder: String) {
        self.placeholder = placeholder
        self.borderStyle = .roundedRect
    }
}

extension UIView {
    func opacityGradient() {
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
        self.setTitle(title, for: .disabled)
        self.setTitle(title, for: .focused)
    }
    
    func setTitleColor(_ color: UIColor) {
        self.setTitleColor(color, for: .normal)
        self.setTitleColor(color, for: .disabled)
        self.setTitleColor(color, for: .focused)
    }
    
    func createButton(named title: String) -> UIButton {
        self.backgroundColor = UIColor.white
        self.setTitle(title)
        self.setTitleColor(UIColor.blue)
        return self
    }
}

extension CellDataModel: Equatable {}

func ==(lhs: CellDataModel, rhs: CellDataModel) -> Bool {
    let areEqual = lhs.value == rhs.value
    
    return areEqual
}
