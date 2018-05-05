//
//  CellProtocol.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 16.04.18.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

protocol CellProtocol {
    var title: String { get }
    var descr: String { get }
    var type: DataStructureType { get }
    var url: URL { get }
}
