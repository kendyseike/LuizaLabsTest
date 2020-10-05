//
//  LoadingViewController.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 02/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {

    var presenter: LoadingPresenter!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.loadModuleIO()
    }
}
