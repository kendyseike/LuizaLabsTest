//
//  LoadingProtocol.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 05/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

protocol LoadingProtocol: class {
    func dismissedLoadingWithError(errorMessage: String)
    func retrievedTweetsWithSuccess(user: User)
}
