//
//  TodosViewInput.swift
//  viper
//
//  Created by Su Van Ho on 9/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import Foundation

protocol TodosViewInput: class {
    func showEmptyMessage()
    func showData(_ data: Any)
}
