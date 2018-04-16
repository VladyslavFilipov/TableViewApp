//
//  CellModel.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 16.04.18.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation
import UIKit

struct CellModel: CellProtocol {
    
    func configure(_ text: String, _ label: UILabel) {
        label.text = text
    }
}
