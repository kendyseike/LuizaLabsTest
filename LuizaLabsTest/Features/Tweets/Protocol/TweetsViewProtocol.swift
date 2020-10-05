//
//  TweetsViewProtocol.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 02/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

protocol TweetsViewProtocol: class {
    func showAlertWithError(errorMessage: String)
    func showAlertAnalyzingTextWithError(errorMessage: String)
    
    func loadViewWithUserInfo(user: User)
    func analyzingTweet(tweet: Tweet, tweetIndex: Int)
    func showTweetTextSentiment(tweet: Tweet, tweetIndex: Int)
}
