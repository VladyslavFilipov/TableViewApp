//
//  AdapterProtocol.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 27.04.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation
import UIKit

protocol AdapterProtocol {
    func setUpControllers(by manager: ControlManagerProtocol, in view: UIStackView, and otherView: UIStackView?)
}
