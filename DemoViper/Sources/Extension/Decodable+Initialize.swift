//
//  Decodable+Initialize.swift
//  DemoViper
//
//  Created by Nguyen M. Tam on 4/20/20.
//  Copyright © 2020 Nimble Co. Ltd. All rights reserved.
//

import Foundation

extension Decodable {

    init?(from json: String) {
        guard
            let data = json.data(using: .utf8),
            let value = try? JSONDecoder().decode(Self.self, from: data) else { return nil }
        self = value
    }
}
