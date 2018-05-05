//
//  CMFactoryProtocol.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 27.04.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

protocol ControlManagerFactoryProtocol {
    static func getControlManager(byType: DataStructureType) -> ControlManagerProtocol
}
