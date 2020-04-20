//
//  ReposViewControllerSpec.swift
//  DemoViper Tests
//
//  Created by Nguyen M. Tam on 4/20/20.
//  Copyright © 2020 Nimble Co. Ltd. All rights reserved.
//

import Quick
import Nimble

@testable import DemoViper

final class ReposViewControllerSpec: QuickSpec {

    override func spec() { 

        var viewController: ReposViewController!
        var output: ReposViewOutputMock!

        describe("a Repos view controller ") { 

            beforeEach { 
                output = ReposViewOutputMock()

                viewController = ReposViewController()
                viewController.output = output
            }

            context("when viewDidLoad() is called") { 

                beforeEach { 
                    viewController.viewDidLoad()
                }

                it("calls presenter viewDidLoad()") { 
                    expect(output.viewDidLoadCalled) == true
                }
            }
        }
    }
}
