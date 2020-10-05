//
//  TweetsWireframe.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 02/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

import UIKit

class TweetsWireframe: AbstractWireframe {
    static func makeModule(moduleIO: ModuleIO?) -> UIViewController {
        let viewController = TweetsViewController()
        let wireframe = TweetsWireframe(viewController: viewController)
        let presenter = TweetsPresenter(view: viewController, moduleIO: moduleIO)

        let interactor = TweetsInteractor()
        
        interactor.delegate = presenter
                
        presenter.interactor = interactor
        
        presenter.wireframe = wireframe
        presenter.view = viewController
        viewController.presenter = presenter
        
        return viewController
    }
    
    func showLoading(moduleIO: ModuleIO, tweetsPresenterDelegate: TweetsPresenter) {
        let loadingViewController = LoadingWireframe.makeModule(moduleIO: moduleIO, tweetsPresenterDelegate: tweetsPresenterDelegate)
        loadingViewController.modalTransitionStyle = .crossDissolve
        loadingViewController.modalPresentationStyle = .overFullScreen
        self.presentModule(viewController: loadingViewController, animated: true)
    }
}
