//
//  Owner.swift
//  DemoViper
//
//  Created by Su Van Ho on 13/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import Foundation

final class Owner {
    let id: Int
    let login: String
    let avatarPath: String
    let htmlPath: String

    init(id: Int,
         login: String,
         avatarPath: String,
         path: String,
         htmlPath: String) {
        self.id = id
        self.login = login
        self.avatarPath = avatarPath
        self.htmlPath = htmlPath
    }
}

extension Owner: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatarPath = "avatar_url"
        case htmlPath = "html_url"
    }
}
