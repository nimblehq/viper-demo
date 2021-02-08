//
//  KIFTestActor+Ultilities.swift
//  UITestsKIF
//
//  Created by Nguyen M. Tam on 12/01/2021.
//  Copyright © 2021 Nimble Co. Ltd. All rights reserved.
//

import Nimble
import KIF

private let temporaryTappableIdentifier = "tappableView.temporaryIdentifier"

extension KIFUITestActor {

    func waitAndTapView(with identifier: String) {
        guard let view = waitForView(withAccessibilityLabel: identifier) else {
            Nimble.fail("View is hidden. Identifier: \(identifier)")
            return
        }
        view.tap()
    }

    func getTextOfView(with identifier: String) -> String? {
        guard let view = waitForView(withAccessibilityLabel: identifier) else {
            Nimble.fail("View is hidden. Identifier: \(identifier)")
            return nil
        }
        if let label = view as? UILabel {
            return label.text
        }
        if let textField = view as? UITextField {
            return textField.text
        }
        if let textView = view as? UITextView {
            return textView.text
        }
        if let button = view as? UIButton {
            return button.titleLabel?.text
        }
        return nil
    }

    func clearAndEnterText(_ text: String, with identifier: String) {
        guard let _ = waitForView(withAccessibilityLabel: identifier) else {
            Nimble.fail("View is hidden. \n+ Identifier: \(identifier)")
            return
        }
        clearTextFromView(withAccessibilityLabel: identifier)
        enterText(text, intoViewWithAccessibilityLabel: identifier)
    }

    func tapCell(at indexPath: IndexPath, inTableView identifier: String) -> UITableViewCell? {
        let cell = getCell(at: indexPath, inTableView: identifier)
        cell?.tap()
        return cell
    }

    func getCell(at indexPath: IndexPath, inTableView identifier: String) -> UITableViewCell? {
        guard let cell = tester().waitForCell(at: indexPath, inTableViewWithAccessibilityIdentifier: identifier, at: .none) else {
            Nimble.fail("Cell is not available. \n+ Cell index path: \(indexPath). \n+ Table view identifier: \(identifier)")
            return nil
        }
        return cell
    }
}
