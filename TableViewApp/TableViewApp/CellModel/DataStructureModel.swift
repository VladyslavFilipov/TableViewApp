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
    
    private var title: String
    private var descr: String
    private var link: String
    
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
    
    func getLink() -> URL {
        guard let url = URL(string: self.link) else { return URL(string: "http://4pda.ru")! }
        return url
    }
}
