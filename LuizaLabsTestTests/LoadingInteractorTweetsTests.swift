//
//  LoadingInteractorTweetsTests.swift
//  LuizaLabsTestTests
//
//  Created by Kendy Nagao on 05/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

import XCTest
import Alamofire
@testable import LuizaLabsTest

class LoadingInteractorTweetsTests: XCTestCase {
    
    func testTwitterUserTweetsBadRequest() {
        let e = expectation(description: "Alamofire")
        let userName = "!"
        let request = TweetsIdsFromUserRequest(userName: userName)
        
        AF.request(URL(string: request.path) ?? "", method: .get, encoding: JSONEncoding.default, headers: request.headers).responseData { (response) in
            XCTAssertEqual(response.response?.statusCode, 400)
            e.fulfill()
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func testTwitterUserWithoutTweets() {
        let e = expectation(description: "Alamofire")
        let userName = "1"
        let request = TweetsIdsFromUserRequest(userName: userName)
        
        AF.request(URL(string: request.path) ?? "", method: .get, encoding: JSONEncoding.default, headers: request.headers).responseData { (response) in
            if let dataResponse = response.data {
                guard let tweetsResponse = try? JSONDecoder().decode(TwitterUserTweetsErrorResponseData.self, from: dataResponse) else {
                    XCTFail(">>>>>>>> Não conseguiu fazer o parse para o objeto de erro <<<<<<<<")
                    return
                }
                XCTAssertEqual(tweetsResponse.meta.result_count, 0)
                e.fulfill()
            }
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func testTwitterUserWithTweets() {
        let e = expectation(description: "Alamofire")
        
        let request = TweetsIdsFromUserRequest(userName: "Google")
        
        AF.request(URL(string: request.path) ?? "", method: .get, encoding: JSONEncoding.default, headers: request.headers).responseData { (response) in
            if let dataResponse = response.data {
                guard let userResponse = try? JSONDecoder().decode(TwitterUserTweetsResponseData.self, from: dataResponse) else {
                    XCTFail(">>>>>>>> Não conseguiu fazer o parse para o objeto de sucesso <<<<<<<<")
                    return
                }
                XCTAssertEqual(userResponse.data.count, 10)
                e.fulfill()
            }
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
}
