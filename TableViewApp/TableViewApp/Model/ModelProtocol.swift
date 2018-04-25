//
//  ModelProtocol.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 13.04.18.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

protocol ModelProtocol {
    var count: Int { get }
    
    func add(value: DataStructureModel)
    func get(at index: Int) -> DataStructureModel
}
