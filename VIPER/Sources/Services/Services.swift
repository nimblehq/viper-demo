//
//  Services.swift
//  viper
//
//  Created by Su Van Ho on 12/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import Foundation

final class Services {
    static let shared: Services = Services()

    func api() -> API {
        return API()
    }
    
    func coreData() -> CoreData {
        // For examples
        return CoreData()
    }
}
