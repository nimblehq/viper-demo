//
//  IdentifierProvidable.swift
//  UITestsKIF
//
//  Created by Nguyen M. Tam on 07/01/2021.
//  Copyright © 2021 Nimble Co. Ltd. All rights reserved.
//

import Foundation

protocol IdentifierProvidable {

    static var domain: String { get }

    var identifier: String { get }

    static func identifier(of element: Self) -> String
}

extension IdentifierProvidable where Self: RawRepresentable, RawValue == String {

    var identifier: String {
        return Self.domain + "." + rawValue
    }

    static func identifier(of element: Self) -> String {
        return Self.domain + "." + element.rawValue
    }
}
