//
//  Mapping.swift
//  viper
//
//  Created by Su Van Ho on 12/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import Foundation

extension Data {
    func map<T>(_ type: T.Type) throws -> T where T: Decodable {
        return try JSONDecoder().decode(T.self, from: self)
    }
}
