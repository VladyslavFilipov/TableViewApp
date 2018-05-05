//
//  VizualizationTableViewCell.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 25.04.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import UIKit

class VisualizationTableViewCell: UITableViewCell, VisualisationTableCellProtocol {

    @IBOutlet weak var cellTitleLabel: UILabel!
    
    func setTitle(_ title: String) {
        self.cellTitleLabel.text = title
    }
}
