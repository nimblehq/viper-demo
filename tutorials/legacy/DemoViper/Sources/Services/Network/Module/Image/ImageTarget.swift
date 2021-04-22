//
//  ImageTarget.swift
//  viper
//
//  Created by Su Van Ho on 12/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import Foundation

enum ImageTarget {
    case download(String)
}

// MARK: - TargetType
extension ImageTarget: TargetType {
    var baseURL: String {
        return ""
    }
    
    var path: String {
        switch self {
        case .download(let path):
            return path
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        return .request
    }
    
    var headers: [String: String]? {
        return nil
    }
}
