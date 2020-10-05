//
//  UIViewController.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 02/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

import UIKit

extension UIViewController {
    public func showAlert(title: String, message: String, buttonMsg: String? = "OK", okHandler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: "\(AlertTexts.alert_error_placeholder.rawValue)\(message)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonMsg, style: .default, handler: okHandler))
        present(alert, animated: true, completion: nil)
    }
}
