//
//  Model.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 13.04.18.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

class ModelData: ModelProtocol {

    var dataStructArray = ["Stack", "Queue", "Set", "Dequeue", "Priority Queue", "List(Array)", "MultiSet", "Dictionary"]
    
    var count: Int { get { return dataStructArray.count } }
    
    func add (value: String) {
        dataStructArray.append(value)
    }
    
    func get (at index: Int) -> String {
        if index >= dataStructArray.count {
            return "array with dataStructures have ended"
        } else {
            return dataStructArray[index]
        }
    }
}
