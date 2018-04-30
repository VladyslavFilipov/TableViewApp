//
//  CMFactory.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 27.04.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

class ControlManagerFactory: ControlManagerFactoryProtocol {
    static func getControlManager(byType: DataStructureType) -> ControlManagerProtocol {
        
        switch byType {
        case .stack:
            return StackManager()
        case .queue:
            return QueueManager()
        case .set:
            return SetManager()
        case .dequeue:
            return DequeueManager()
//        case "Priority Queue":
//            return PriorityQueueManager()
//        case "List(Array)":
//            return ListManager()
        case .multiSet:
            return MultiSetManager()
//        case "Dictionary":
//            return DictionaryManager()
        default:
            return QueueManager()
        }
    }
}
