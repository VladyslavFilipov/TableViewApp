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
    
    private var name: String
    private var definition: String
    private var link: String
    private var exemplar: DataStructureType
    
    init(title: String, deskr: String, link: String, type: DataStructureType) {
        self.name = title
        self.definition = deskr
        self.link = link
        self.exemplar = type
    }
    
    var title: String { return self.name }
    
    var descr: String { return self.definition }
    
    var type: DataStructureType { return self.exemplar }
    
    var url: URL {
        guard let url = URL(string: self.link) else { return URL(string: "https://www.wikipedia.org")! }
        return url
    }
}
