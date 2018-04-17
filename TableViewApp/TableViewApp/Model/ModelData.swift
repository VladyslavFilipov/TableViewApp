//
//  Model.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 13.04.18.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

class ModelData: ModelProtocol {

    private var dataStructArray = [DataStructureModel(title: "Stack"), DataStructureModel(title: "Queue"), DataStructureModel(title: "Set"), DataStructureModel(title: "Dequeue"), DataStructureModel(title: "Priority Queue"), DataStructureModel(title: "List(Array)"), DataStructureModel(title: "MultiSet"), DataStructureModel(title: "Dictionary")]
    
    var count: Int { get { return dataStructArray.count } }
    
    func add (value: DataStructureModel) {
        dataStructArray.append(value)
    }
    
    func get (at index: Int) -> DataStructureModel {
        if index >= dataStructArray.count {
            return DataStructureModel(title: "array with dataStructures have ended")
        } else {
            return dataStructArray[index]
        }
    }
}
