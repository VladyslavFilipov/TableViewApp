//
//  VisualizationDataModel.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 02.05.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation
import UIKit

class VisualizationDataModel: VisualizationTableViewController {
    
//    var dataArray: [CellDataModel] = []
//    var visualizationTableData: VisualizationTableDataProtocol?
//    let table = VisualizationTableViewController()
//    
//    
//    func set(delegate: VisualizationTableDataProtocol) {
//        self.visualizationTableData = delegate
//    }
//    
//    func instantiate() {
//        self.set(delegate: visualizationTableData!)
//        visualizationTableData = table
//    }
//    
//    
//    
//    override func add(index: Int, value: String, status: Status) {
//        print("Working")
//        dataArray.insert(CellDataModel(value, status), at: index)
//        print(DataSructureModelArray)
//        table.add(index: index, value: value, status: status)
//        print(table.DataSructureModelArray)
//        updateTable()
//        print("Working------")
//    }
//    
//    override func delete(index: Int) {
//        let table = visualizationTableData
//        if !DataSructureModelArray.indices.contains(index) { return }
//        else {
//            DataSructureModelArray.remove(at: index)
//            table?.delete(index: index)
//        }
//        updateTable()
//    }
//    
//    override func updateTable() {
//        var table = visualizationTableData
//        for index in 0..<DataSructureModelArray.count {
//            if dataArray[index].helperValue == 1 {
//                table?.DataSructureModelArray[index].0 = dataArray[index].value
//            } else {
//                guard let extraValue = dataArray[index].helperValue else { return }
//                table?.DataSructureModelArray[index].0 = dataArray[index].value + "\t\(extraValue)"
//            }
//        }
//    }
}
