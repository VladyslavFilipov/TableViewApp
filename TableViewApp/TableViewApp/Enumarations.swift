//
//  Enumarations.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 27.04.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

enum DataStructureType {
    case stack
    case queue
    case set
    case multiSet
    case dequeue
    case priorityQueue
    case list
    case dictionary
}

enum MenuType {
    case button(title: String, action: ()->() )
    case textField(placeholder: String, action: (String)->() )
    case stateSwitch(action: (Bool)->())
}

enum Status {
    case highlighted
    case common
}


