//
//  CellProtocol.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 16.04.18.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

protocol CellProtocol {
    func getTitle() -> String
    func getDescr() -> String
    func getType() -> DataStructureType
}
