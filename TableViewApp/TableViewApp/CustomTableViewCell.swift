//
//  TableViewCell.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 12.04.18.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var firstTypeCellLabel: UILabel!
    
    func setCustomTableViewCellLabelText(_ text: String) {
        firstTypeCellLabel.text = text
    }
}
