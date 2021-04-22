//
//  RepoTarget.swift
//  viper
//
//  Created by Su Van Ho on 12/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import Foundation

enum RepoTarget {
    case list
    case info(Int)
}

// MARK: - TargetType
extension RepoTarget: TargetType {
    var baseURL: String {
        return "https://api.github.com/repositories"
    }
    
    var path: String {
        switch self {
        case .list:
            return ""
        case .info(let id):
            return "/\(id)"
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
