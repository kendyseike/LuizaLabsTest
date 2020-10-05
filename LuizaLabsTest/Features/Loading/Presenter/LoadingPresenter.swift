//
//  LoadingPresenter.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 02/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

import UIKit

class LoadingPresenter: BasePresenter {
    var interactor: LoadingInteractor!
    var wireframe: LoadingWireframe!
    weak var delegate: LoadingProtocol?
    
    var user: User?
    
    init(moduleIO : ModuleIO? = nil) {
        super.init()
        
        self.moduleIO = moduleIO        
    }
    
    func loadModuleIO() {
        guard let user = self.moduleIO?.getObject(type: LoadingModel.self) else { return }
        
        getTwitterUser(userName: user.userName ?? "")
    }
    
    func getTwitterUser(userName: String) {
        interactor.getTwitterUser(userName: userName)
    }
}

extension LoadingPresenter: LoadingInteractorOutputDelegate {
    func unexpectedErrorRetrievingUser(errorMessage: String) {
        wireframe.dismissLoadingView(completion: {
            self.delegate?.dismissedLoadingWithError(errorMessage: errorMessage)
        })
    }
    
    func unexpectedErrorRetrievingTweetsFromUser(errorMessage: String) {
        wireframe.dismissLoadingView(completion: {
            self.delegate?.dismissedLoadingWithError(errorMessage: errorMessage)
        })
    }
    
    func unexpectedErrorCalculatingSentimentFromText(errorMessage: String) {
        wireframe.dismissLoadingView(completion: {
            self.delegate?.dismissedLoadingWithError(errorMessage: errorMessage)
        })
    }
    
    func failedToRetrieveTweetsFromUser(errorMessage: String) {
        wireframe.dismissLoadingView(completion: {
            self.delegate?.dismissedLoadingWithError(errorMessage: errorMessage)
        })
    }
    
    func failedToRetrieveUser(errorMessage: String) {
        wireframe.dismissLoadingView(completion: {
            self.delegate?.dismissedLoadingWithError(errorMessage: errorMessage)
        })
    }
    
    func retrievedTweetsIds(tweetsIds: [String]) {
        interactor.getTweetsFromUser(tweetsIds: tweetsIds)
    }
    
    func retrievedTweets(tweets: [Tweet]) {
        self.user?.tweets = tweets
        wireframe.dismissLoadingView(completion: {
            if let twitterUser = self.user {
                self.delegate?.retrievedTweetsWithSuccess(user: twitterUser)
                return
            }
            self.delegate?.dismissedLoadingWithError(errorMessage: AlertTexts.alert_error_generic_msg.rawValue)
        })
    }
    
    func retrievedUser(userName: String, userNickname: String) {
        self.user = User(id: "", name: userName, username: userNickname, tweets: nil)
        interactor.getTweetsIdsFromUser(userName: userNickname)
    }
}
