//
//  CellModel.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 16.04.18.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation
import UIKit

struct DataStructureModel: CellProtocol  {
    
    var title: String
    var descr: String
    var link: String
    
    init(title: String, deskr: String, link: String) {
        self.title = title
        self.descr = deskr
        self.link = link
    }
    
    func getTitle() -> String {
        return self.title
    }
    
    func getDescr() -> String {
        return self.descr
    }
}
