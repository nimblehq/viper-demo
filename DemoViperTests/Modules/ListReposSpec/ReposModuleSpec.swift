//
//  ReposModuleSpec.swift
//  DemoViper Tests
//
//  Created by Nguyen M. Tam on 4/20/20.
//  Copyright © 2020 Nimble Co. Ltd. All rights reserved.
//

import Quick
import Nimble

@testable import DemoViper

final class ReposModuleSpec: QuickSpec {

    override func spec() { 

        var output: ReposOutput!
        var module: ReposModule!

        describe("a Repos module") { 

            context("when initialize module") { 

                beforeEach { 
                    output = ReposOutputMock()
                    module = ReposModule()
                    module.output = output
                }

                it("sets view output with presenter") { 
                    let view = module.view
                    expect(view.output).to(beAKindOf(ReposPresenter.self))
                }

                it("sets presenter's view, router, interactor, input, output") { 
                    let presenter = module.presenter
                    expect(presenter.view).to(beAKindOf(ReposViewController.self))
                    expect(presenter.router).to(beAKindOf(ReposRouter.self))
                    expect(presenter.interactor).to(beAKindOf(ReposInteractor.self))
                    expect(presenter.output) === output
                    expect(presenter) === module.input       
                }

                it("sets interactor output with presenter") { 
                    let interactor = module.interactor 
                    expect(interactor.output).to(beAKindOf(ReposPresenter.self))
                }

                it("sets router's view") { 
                    let router = module.router
                    expect(router.view).to(beAKindOf(ReposViewController.self))
                }
            }
        }
    }
}
