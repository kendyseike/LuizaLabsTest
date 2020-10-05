//
//  LoadingInteractorOutputDelegate.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 02/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

protocol LoadingInteractorOutputDelegate: class {
    func failedToRetrieveUser(errorMessage: String)
    func failedToRetrieveTweetsFromUser(errorMessage: String)
    func unexpectedErrorRetrievingUser(errorMessage: String)
    func unexpectedErrorRetrievingTweetsFromUser(errorMessage: String)
    
    func retrievedUser(userName: String, userNickname: String)
    func retrievedTweetsIds(tweetsIds: [String])
    func retrievedTweets(tweets: [Tweet])    
}
