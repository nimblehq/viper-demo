//
//  String+Email.swift
//  Tutorial1
//
//  Created by Su Van Ho on 26/05/2021.
//

import Foundation

extension String {

    var isEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: self)
    }
}
