//
//  TweetsInteractorSentimentTests.swift
//  LuizaLabsTestTests
//
//  Created by Kendy Nagao on 05/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

import XCTest
import Alamofire
@testable import LuizaLabsTest

class TweetsInteractorSentimentTests: XCTestCase {

    func testAnalyzeSentimentBadRequest() {
        let e = expectation(description: "Alamofire")
        let request = DocumentSentimentRequest(content: "", documentType: "ssss")
        
        AF.request(URL(string: request.path) ?? "", method: .post, parameters: request.parseDictionaryRequestBody(), encoding: JSONEncoding.default, headers: request.headers).responseData { (response) in
            
            XCTAssertEqual(response.response?.statusCode, 400)
            e.fulfill()
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func testAnalyzeSentimentHappy() {
        let e = expectation(description: "Alamofire")
        let request = DocumentSentimentRequest(content: "Me sinto feliz")
        
        AF.request(URL(string: request.path) ?? "", method: .post, parameters: request.parseDictionaryRequestBody(), encoding: JSONEncoding.default, headers: request.headers).responseData { (response) in
                        
            if let dataResponse = response.data {
                guard let textSentimentResponse = try? JSONDecoder().decode(DocumentSentimentResponseData.self, from: dataResponse) else {
                    debugPrint(">>>>>>>> Correto! Não conseguiu fazer o parse, pois objeto não é o de sucesso <<<<<<<<")
                    guard (try? JSONDecoder().decode(DocumentSentimentErrorResponseData.self, from: dataResponse)) != nil else {
                        XCTFail(">>>>>>>> Não conseguiu fazer o parse para o objeto de erro <<<<<<<<")
                        return
                    }
                    XCTFail(">>>>>>>> Fez parse para objeto de erro indevidamente <<<<<<<<")
                    return
                }
                                
                XCTAssertEqual(textSentimentResponse.documentSentiment.score, 0.9)
                e.fulfill()
                return
            }
        }
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func testAnalyzeSentimentNeutral() {
        let e = expectation(description: "Alamofire")
        let request = DocumentSentimentRequest(content: "Estou normal")
        
        AF.request(URL(string: request.path) ?? "", method: .post, parameters: request.parseDictionaryRequestBody(), encoding: JSONEncoding.default, headers: request.headers).responseData { (response) in
                        
            if let dataResponse = response.data {
                guard let textSentimentResponse = try? JSONDecoder().decode(DocumentSentimentResponseData.self, from: dataResponse) else {
                    debugPrint(">>>>>>>> Correto! Não conseguiu fazer o parse, pois objeto não é o de sucesso <<<<<<<<")
                    guard (try? JSONDecoder().decode(DocumentSentimentErrorResponseData.self, from: dataResponse)) != nil else {
                        XCTFail(">>>>>>>> Não conseguiu fazer o parse para o objeto de erro <<<<<<<<")
                        return
                    }
                    XCTFail(">>>>>>>> Fez parse para objeto de erro indevidamente <<<<<<<<")
                    return
                }
                                
                XCTAssertEqual(textSentimentResponse.documentSentiment.score, 0.0)
                e.fulfill()
                return
            }
        }
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func testAnalyzeSentimentSad() {
        let e = expectation(description: "Alamofire")
        let request = DocumentSentimentRequest(content: "Estou triste")
        
        AF.request(URL(string: request.path) ?? "", method: .post, parameters: request.parseDictionaryRequestBody(), encoding: JSONEncoding.default, headers: request.headers).responseData { (response) in
                        
            if let dataResponse = response.data {
                guard let textSentimentResponse = try? JSONDecoder().decode(DocumentSentimentResponseData.self, from: dataResponse) else {
                    debugPrint(">>>>>>>> Correto! Não conseguiu fazer o parse, pois objeto não é o de sucesso <<<<<<<<")
                    guard (try? JSONDecoder().decode(DocumentSentimentErrorResponseData.self, from: dataResponse)) != nil else {
                        XCTFail(">>>>>>>> Não conseguiu fazer o parse para o objeto de erro <<<<<<<<")
                        return
                    }
                    XCTFail(">>>>>>>> Fez parse para objeto de erro indevidamente <<<<<<<<")
                    return
                }
                                
                XCTAssertEqual(textSentimentResponse.documentSentiment.score, -0.8)
                e.fulfill()
                return
            }
        }
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func testAnalyzeSentimentFromRealTweet() {
        let e = expectation(description: "Alamofire")
        let request = TweetsIdsFromUserRequest(userName: "Google")
        
        AF.request(URL(string: request.path) ?? "", method: .get, encoding: JSONEncoding.default, headers: request.headers).responseData { (response) in
            if let dataResponse = response.data {
                guard let userResponse = try? JSONDecoder().decode(TwitterUserTweetsResponseData.self, from: dataResponse) else {
                    XCTFail(">>>>>>>> Não conseguiu fazer o parse para o objeto de sucesso <<<<<<<<")
                    return
                }
                let request = DocumentSentimentRequest(content: userResponse.data.first?.text ?? "")
                
                AF.request(URL(string: request.path) ?? "", method: .post, parameters: request.parseDictionaryRequestBody(), encoding: JSONEncoding.default, headers: request.headers).responseData { (response) in
                                
                    if let dataResponse = response.data {
                        guard let textSentimentResponse = try? JSONDecoder().decode(DocumentSentimentResponseData.self, from: dataResponse) else {
                            debugPrint(">>>>>>>> Correto! Não conseguiu fazer o parse, pois objeto não é o de sucesso <<<<<<<<")
                            guard (try? JSONDecoder().decode(DocumentSentimentErrorResponseData.self, from: dataResponse)) != nil else {
                                XCTFail(">>>>>>>> Não conseguiu fazer o parse para o objeto de erro <<<<<<<<")
                                return
                            }
                            XCTFail(">>>>>>>> Fez parse para objeto de erro indevidamente <<<<<<<<")
                            return
                        }
                        debugPrint("@@@@@@@@ Resultado Sentiment: \(AnalyzeSentiment().getSentiment(score: textSentimentResponse.documentSentiment.score))")
                        XCTAssertNotNil(AnalyzeSentiment().getSentiment(score: textSentimentResponse.documentSentiment.score), "Teste passou!")
                        e.fulfill()
                    }
                }
            }
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }

}
