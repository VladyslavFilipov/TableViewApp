//
//  Model.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 13.04.18.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

class ModelData: ModelProtocol {

    var dataStructArray: Array<String> = ["Stack", "Queue", "Set", "Dequeue", "Priority Queue", "List(Array)", "MultiSet", "Dictionary"]
    
    func count () -> Int {
        return dataStructArray.count
    }
    
    func add (value: String) {
        dataStructArray.append(value)
    }
    
    func get (at index: Int) -> String {
        return dataStructArray[index]
    }
}
