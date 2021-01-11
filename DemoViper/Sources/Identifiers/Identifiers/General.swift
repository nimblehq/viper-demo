//
//  General.swift
//  DemoViper
//
//  Created by Nguyen M. Tam on 11/01/2021.
//  Copyright © 2021 Nimble Co. Ltd. All rights reserved.
//

extension Identifier {

    enum General: String, IdentifierProvidable {

        case backButton = "navigationBar.backButton"
        case bookmarkButton = "navigationBar.bookmarkButton"
        case webview = "webview.view"

        static var domain: String { "general" }
    }
}
