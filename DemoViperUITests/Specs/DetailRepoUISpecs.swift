//
//  DetailRepoUISpecs.swift
//  UITests
//
//  Created by Nguyen M. Tam on 13/01/2021.
//  Copyright © 2021 Nimble Co. Ltd. All rights reserved.
//

import Quick
import Nimble

@testable import DemoViper

final class DetailRepoUISpecs: QuickSpec {

    override func spec() {
        describe("detail repo") {

            var application: XCUIApplication!

            beforeEach {
                self.setUpSpec() 
                application = setUpTestEnvironment()
                application.launch()
                application.tapRepoCell(at: 0)
            }

            it("open the detail repo screen successfully") {
                let view = application.views[DetailRepo.view.identifier].firstMatch
                expect(view.exists).toEventually(beTrue(), timeout: .medium)
            }

            context("no repo is added to bookmark") {

                it("verify initial data the detail repo screen") {
                    let bookmarkButton = application.buttons[General.bookmarkButton.identifier].firstMatch
                    expect(bookmarkButton.exists).toEventually(beTrue(), timeout: .medium)
                }
            }

            context("a repo is added to bookmark") {

                it("verify initial data the detail repo screen") {
                    application.tapBookmarkButton()

                    let bookmarkButton = application.buttons[General.bookmarkButton.identifier].firstMatch
                    expect(bookmarkButton.isEnabled).toEventually(beFalse(), timeout: .medium)
                }
            }

            context("open the web page of the repo") {

                it("verify opening web page with safari") {
                    application.tapAuthorView()

                    let view = application.views[General.webview.identifier].firstMatch
                    expect(view.exists).toEventually(beTrue(), timeout: .medium)
                }
            }

            afterEach {
                application.terminate()
            }
        }
    }
}
