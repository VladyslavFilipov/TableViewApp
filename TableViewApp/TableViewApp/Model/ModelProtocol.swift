//
//  ModelProtocol.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 13.04.18.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

protocol ModelProtocol {
    var dataStructArray: Array<String> { get }
    func count() -> Int
    func add(value: String)
    func get(at index: Int) -> String
}
