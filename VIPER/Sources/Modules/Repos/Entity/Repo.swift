//
//  Repo.swift
//  viper
//
//  Created by Su Van Ho on 12/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import Foundation

final class Repo {
    let id: Int
    let name: String
    let fullName: String
    
    init(id: Int, name: String, fullName: String) {
        self.id = id
        self.name = name
        self.fullName = fullName
    }
}

extension Repo: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
    }
}
