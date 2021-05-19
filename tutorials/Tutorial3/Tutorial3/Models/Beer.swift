//
//  Beer.swift
//  Tutorial3
//
//  Created by Su Van Ho on 19/05/2021.
//

struct Beer: Decodable {

    let id: Int
    let name: String
    let description: String
    let imageURLString: String

    private enum CodingKeys: String, CodingKey {

        case id, name, description
        case imageURLString = "image_url"
    }
}
