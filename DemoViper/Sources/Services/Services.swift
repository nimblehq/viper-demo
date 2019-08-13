//
//  Services.swift
//  DemoViper
//
//  Created by Su Van Ho on 13/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import Foundation

final class Services {
    static let shared: Services = Services()

    func network() -> Network {
        return Network()
    }
}
