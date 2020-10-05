//
//  AbstractWireframe.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 02/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

import UIKit

class AbstractWireframe {
    typealias CompletionHandler = () -> Void
    weak var viewController: UIViewController?

    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func onDismiss(animated: Bool, completionBlock: @escaping CompletionHandler) {
        self.viewController?.dismiss(animated: true, completion: completionBlock)
    }

    func presentModule(viewController : UIViewController, animated : Bool) {
        self.viewController?.present(viewController, animated: animated, completion: nil)
    }
}
