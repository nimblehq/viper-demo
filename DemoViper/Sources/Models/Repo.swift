//
//  Repo.swift
//  DemoViper
//
//  Created by Su Van Ho on 13/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import Foundation

final class Repo: Codable {
    let id: Int
    let name: String
    let fullName: String
    var didBookmark: Bool? = false
}
