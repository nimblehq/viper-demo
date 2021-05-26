//
//  BeerService.swift
//  Tutorial3
//
//  Created by Su Van Ho on 19/05/2021.
//

import Moya

enum BeerService {

    case list
    case detail(id: Int)
}


extension BeerService: TargetType {

    var baseURL: URL { URL(string: "https://api.punkapi.com/v2/")! }

    var path: String {
        switch self {
        case .list:
            return "beers"
        case .detail(let id):
            return "beers/\(id)"
        }
    }

    var method: Method { .get }

    var sampleData: Data { Data() }

    var task: Task { .requestPlain }

    var headers: [String : String]? { nil }
}
