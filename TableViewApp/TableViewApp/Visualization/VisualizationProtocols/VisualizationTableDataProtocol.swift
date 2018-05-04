//
//  VisualizationTableDataProtocol.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 27.04.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

protocol VisualizationTableDataProtocol {
    
    var array: [(text: String, status: Status)] { get set }
    
    func add(index: Int, value: String, status: Status)
    
    func delete(index: Int)
    
    func updateTable()
}
