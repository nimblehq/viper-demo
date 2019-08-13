//
//  ReposViewController.swift
//  DemoViper
//
//  Created by Su Van Ho on 13/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import UIKit

final class ReposViewController: UIViewController {
    
    var output: ReposViewOutput?

    override func viewDidLoad() { 
        super.viewDidLoad()
        output?.viewDidLoad()
    }

}

// MARK: - ReposViewInput

extension ReposViewController: ReposViewInput { 

    func configure() { 
        
    }

}