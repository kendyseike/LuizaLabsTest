//
//  LoadingWireframe.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 02/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

import UIKit

class LoadingWireframe: AbstractWireframe {
    
    static func makeModule(moduleIO: ModuleIO?, tweetsPresenterDelegate: TweetsPresenter) -> UIViewController {
        let viewController = LoadingViewController()
        let wireframe = LoadingWireframe(viewController: viewController)
        let presenter = LoadingPresenter(moduleIO: moduleIO)
        presenter.delegate = tweetsPresenterDelegate
        presenter.wireframe = wireframe
        
        let interactor = LoadingInteractor()
        
        interactor.delegate = presenter
                
        presenter.interactor = interactor
        
        viewController.presenter = presenter
        
        return viewController
    }
    
    func dismissLoadingView(completion: @escaping CompletionHandler) {
        self.onDismiss(animated: true, completionBlock: completion)
    }
}
