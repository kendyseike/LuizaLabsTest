//
//  LoadingModel.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 04/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

class LoadingModel {
    var userName: String?
    var tweet: Tweet?
    
    init(userName: String? = nil, tweet: Tweet? = nil) {
        self.userName = userName
        self.tweet = tweet
    }
}
