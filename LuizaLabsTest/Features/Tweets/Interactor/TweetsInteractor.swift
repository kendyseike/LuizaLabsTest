//
//  TweetsInteractor.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 05/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

import Alamofire

class TweetsInteractor: NSObject {
    weak var delegate: TweetsInteractorOutputDelegate?
    
    func getSentimentFromText(text: String) {
        
        let request = DocumentSentimentRequest(content: text)
        
        AF.request(URL(string: request.path) ?? "", method: .post, parameters: request.parseDictionaryRequestBody(), encoding: JSONEncoding.default, headers: request.headers).responseData { (response) in
            
            if let dataResponse = response.data {
                guard let textSentimentResponse = try? JSONDecoder().decode(DocumentSentimentResponseData.self, from: dataResponse) else {
                    guard let errorResponse = try? JSONDecoder().decode(DocumentSentimentErrorResponseData.self, from: dataResponse) else {
                        self.delegate?.unexpectedErrorCalculatingSentimentFromText(errorMessage: ResponseErrors.unexpected_error_user.rawValue)
                        return
                    }
                    self.delegate?.failedToAnalyzeTextSentiment(errorMessage: errorResponse.error.message)
                    return
                }
                
                self.delegate?.retrievedGoogleSentimentAnalyze(sentiment: AnalyzeSentiment().getSentiment(score: textSentimentResponse.documentSentiment.score))
                
                return
            }
            
            self.delegate?.unexpectedErrorCalculatingSentimentFromText(errorMessage: ResponseErrors.unexpected_error_sentiment.rawValue)
        }
    }
}
