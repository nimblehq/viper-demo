//
//  DetailRepo.swift
//  DemoViper
//
//  Created by Nguyen M. Tam on 07/01/2021.
//  Copyright © 2021 Nimble Co. Ltd. All rights reserved.
//

extension Identifier {

    enum DetailRepo: String, IdentifierProvidable {

        case view
        case repoNameLabel
        case descriptionLabel
        case authorView
        case authorViewTitle
        case authorNameLabel
        case avatarImageView

        static var domain: String { "repo.detailRepo" }
    }
}
