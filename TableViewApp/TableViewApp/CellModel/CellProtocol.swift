//
//  CellProtocol.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 16.04.18.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

protocol CellProtocol {
    var getTitle: String { get }
    var getDescr: String { get }
    var getType: DataStructureType { get }
    var getLink: URL { get }
}
