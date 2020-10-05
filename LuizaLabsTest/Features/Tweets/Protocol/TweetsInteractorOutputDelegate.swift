//
//  TweetsInteractorOutputDelegate.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 05/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

protocol TweetsInteractorOutputDelegate: class {
    func unexpectedErrorCalculatingSentimentFromText(errorMessage: String)
    func failedToAnalyzeTextSentiment(errorMessage: String)
    
    func retrievedGoogleSentimentAnalyze(sentiment: TextSentiment)
}
