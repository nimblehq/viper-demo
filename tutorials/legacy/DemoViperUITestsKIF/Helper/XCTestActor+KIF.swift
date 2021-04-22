//
//  XCTestActor+KIF.swift
//  DemoViperUITestsKIF
//
//  Created by Nguyen M. Tam on 07/01/2021.
//  Copyright © 2021 Nimble Co. Ltd. All rights reserved.
//

import XCTest
import KIF

extension KIFTestActor {

    func tester(file: String = #file, _ line: Int = #line) -> KIFUITestActor {
        return KIFUITestActor(inFile: file, atLine: line, delegate: self)
    }

    func system(file: String = #file, _ line: Int = #line) -> KIFSystemTestActor {
        return KIFSystemTestActor(inFile: file, atLine: line, delegate: self)
    }
}
