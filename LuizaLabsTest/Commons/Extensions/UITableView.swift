//
//  UITableView.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 05/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

import UIKit

extension UITableView {
    func register(_ cell: UITableViewCell.Type) {
        let nib = UINib(nibName: cell.tableIdentifier, bundle: nil)
        register(nib, forCellReuseIdentifier: cell.tableIdentifier)
    }
    
    func registerWithIdentifier(_ cell: UITableViewCell.Type, cellId: String) {
        let nib = UINib(nibName: cell.tableIdentifier, bundle: nil)
        register(nib, forCellReuseIdentifier: cellId)
    }
}
