//
//  ListRepos.swift
//  DemoViper
//
//  Created by Nguyen M. Tam on 07/01/2021.
//  Copyright © 2021 Nimble Co. Ltd. All rights reserved.
//

extension Identifier {

    enum ListRepos: String, IdentifierProvidable {

        case view
        case tableView
        case cellTextLabel

        static var domain: String { "repo.listRepos" }
    }
}
