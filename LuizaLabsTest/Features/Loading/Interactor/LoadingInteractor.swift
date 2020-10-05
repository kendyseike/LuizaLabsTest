//
//  LoadingInteractor.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 02/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

import Alamofire

class LoadingInteractor: NSObject {
    weak var delegate : LoadingInteractorOutputDelegate?
    
    func getTwitterUser(userName: String) {
        let request = TwitterUserRequest(userName: userName)
        
        AF.request(URL(string: request.path) ?? "", method: .get, encoding: JSONEncoding.default, headers: request.headers).responseData { (response) in
            
            if let dataResponse = response.data {
                guard let userResponse = try? JSONDecoder().decode(TwitterUserResponseData.self, from: dataResponse) else {
                    
                    guard let errorResponse = try? JSONDecoder().decode(TwitterErrorResponseData.self, from: dataResponse) else {
                        self.delegate?.unexpectedErrorRetrievingUser(errorMessage: ResponseErrors.unexpected_error_user.rawValue)
                        return
                    }
                    
                    self.delegate?.failedToRetrieveUser(errorMessage: errorResponse.errors?.first?.title ?? ResponseErrors.unexpected_error_user.rawValue)
                    return
                }
                
                self.delegate?.retrievedUser(userName: userResponse.data.name, userNickname: userResponse.data.username)
                
                return
            }
            
            self.delegate?.failedToRetrieveUser(errorMessage: ResponseErrors.unexpected_error_user.rawValue)
        }
    }
    
    func getTweetsIdsFromUser(userName: String) {
        let request = TweetsIdsFromUserRequest(userName: userName)
        
        AF.request(URL(string: request.path) ?? "", method: .get, encoding: JSONEncoding.default, headers: request.headers).responseData { (response) in
            
            if let dataResponse = response.data {
                guard let tweetsIdsResponse = try? JSONDecoder().decode(TwitterUserTweetsResponseData.self, from: dataResponse) else {
                    
                    guard let errorResponse = try? JSONDecoder().decode(TwitterErrorResponseData.self, from: dataResponse) else {
                        self.delegate?.unexpectedErrorRetrievingTweetsFromUser(errorMessage: ResponseErrors.unexpected_error_user.rawValue)
                        return
                    }
                    
                    self.delegate?.failedToRetrieveUser(errorMessage: errorResponse.errors?.first?.title ?? ResponseErrors.unexpected_error_tweets.rawValue)
                    return
                }
                
                let tweetsIds = tweetsIdsResponse.data.map { $0.id }
                self.delegate?.retrievedTweetsIds(tweetsIds: tweetsIds)
                
                return
            }
            
            self.delegate?.unexpectedErrorRetrievingTweetsFromUser(errorMessage: ResponseErrors.unexpected_error_tweets.rawValue)
        }
    }
    
    func getTweetsFromUser(tweetsIds: [String]) {
        let request = TweetsFromUserRequest(tweetsIds: tweetsIds)
        
        AF.request(URL(string: request.path) ?? "", method: .get, encoding: JSONEncoding.default, headers: request.headers).responseData { (response) in
            
            if let dataResponse = response.data {
                guard let tweetsResponse = try? JSONDecoder().decode(TwitterUserTweetsResponseData.self, from: dataResponse) else {
                    
                    guard let errorResponse = try? JSONDecoder().decode(TwitterErrorResponseData.self, from: dataResponse) else {
                        self.delegate?.unexpectedErrorRetrievingTweetsFromUser(errorMessage: ResponseErrors.unexpected_error_user.rawValue)
                        return
                    }
                    
                    self.delegate?.failedToRetrieveTweetsFromUser(errorMessage: errorResponse.errors?.first?.title ?? ResponseErrors.unexpected_error_tweets.rawValue)
                    return
                }
                
                self.delegate?.retrievedTweets(tweets: tweetsResponse.data)
                
                return
            }
            
            self.delegate?.unexpectedErrorRetrievingTweetsFromUser(errorMessage: ResponseErrors.unexpected_error_tweets.rawValue)
        }
    }    
}
