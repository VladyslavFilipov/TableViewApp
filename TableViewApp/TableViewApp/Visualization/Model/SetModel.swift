//
//  SetModel.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 03.05.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

struct SetModel {
    var value: String
    var status: Status
    var text: String
    
    init(_ value: String, _ status: Status = .highlighted) {
        self.value = value
        self.status = status
        self.text = value
    }
}