//
//  TweetsPresenter.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 02/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

import UIKit

class TweetsPresenter: BasePresenter {
    var interactor: TweetsInteractor!
    var wireframe: TweetsWireframe!
    weak var view: TweetsViewProtocol?
    var tweetToBeAnalyzed: Tweet?
    var tweetIndex: Int?
    
    init(view : TweetsViewProtocol, moduleIO : ModuleIO? = nil) {
        super.init()
        
        self.view = view
        self.moduleIO = moduleIO
    }
    
    func loadModuleIO() {
        guard let user = self.moduleIO?.getObject(type: User.self) else { return }
        
        view?.loadViewWithUserInfo(user: user)
    }
    
    func presentLoadingToFetchUserInfo(userName: String) {
        let loadingModel: LoadingModel = LoadingModel(userName: userName, tweet: nil)
        wireframe.showLoading(moduleIO: ModuleIO(withObject: loadingModel), tweetsPresenterDelegate: self)
    }
    
    func analyzeTextSentiment(tweet: Tweet, tweetIndex: Int) {
        self.tweetToBeAnalyzed = tweet
        self.tweetIndex = tweetIndex
        self.tweetToBeAnalyzed?.analyzing = true
        
        if let analyzingTweet = tweetToBeAnalyzed {
            view?.analyzingTweet(tweet: analyzingTweet, tweetIndex: tweetIndex)
        }
        
        interactor.getSentimentFromText(text: tweet.text)
    }
}

extension TweetsPresenter: TweetsInteractorOutputDelegate {
    func unexpectedErrorCalculatingSentimentFromText(errorMessage: String) {
        view?.showAlertWithError(errorMessage: errorMessage)
    }
    
    func failedToAnalyzeTextSentiment(errorMessage: String) {
        view?.showAlertAnalyzingTextWithError(errorMessage: errorMessage)
    }
    
    func retrievedGoogleSentimentAnalyze(sentiment: TextSentiment) {
        tweetToBeAnalyzed?.sentiment = sentiment
        tweetToBeAnalyzed?.analyzing = false
        if let analyzedTweet = tweetToBeAnalyzed, let analyzedTweetIndex = tweetIndex {
            view?.showTweetTextSentiment(tweet: analyzedTweet, tweetIndex: analyzedTweetIndex)
        }
    }
}

extension TweetsPresenter: LoadingProtocol {
    func retrievedTweetsWithSuccess(user: User) {
        view?.loadViewWithUserInfo(user: user)
    }
    
    func dismissedLoadingWithError(errorMessage: String) {
        view?.showAlertWithError(errorMessage: errorMessage)
    }
}
