//
//  CMProtocol.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 27.04.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

protocol ControlManagerProtocol {
    var visualizationTableData: VisualizationTableDataProtocol? { get set }
    
    func createMenu() -> [MenuType]
    
    func set(delegate: VisualizationTableDataProtocol)
}
