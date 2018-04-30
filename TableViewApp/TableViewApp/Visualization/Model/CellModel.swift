//
//  CellModel.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 27.04.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

struct CellDataModel {
    var value: String
    var status: Status
    var helperValue: Int?
    
    init(_ value: String, _ status: Status = .highlighted, _ helperValue: Int? = 1) {
        self.value = value
        self.status = status
        self.helperValue = helperValue
    }
}

