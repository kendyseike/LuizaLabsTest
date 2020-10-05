//
//  LoadingPresenterTests.swift
//  LuizaLabsTestTests
//
//  Created by Kendy Nagao on 05/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

import XCTest
import Alamofire
@testable import LuizaLabsTest

class LoadingInteractorUserTests: XCTestCase {

    func testGetTwitterUserBadRequest() {
        let e = expectation(description: "Alamofire")
        
        let request = TwitterUserRequest(userName: "testeprocurandousuario400")
        
        AF.request(URL(string: request.path) ?? "", method: .get, encoding: JSONEncoding.default, headers: request.headers).responseData { (response) in
            XCTAssertEqual(response.response?.statusCode, 400)
            e.fulfill()
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func testGetTwitterForbiddenUser() {
        let e = expectation(description: "Alamofire")
        let userName = "1"
        let request = TwitterUserRequest(userName: userName)
        
        AF.request(URL(string: request.path) ?? "", method: .get, encoding: JSONEncoding.default, headers: request.headers).responseData { (response) in
            if let dataResponse = response.data {
                guard (try? JSONDecoder().decode(TwitterUserResponseData.self, from: dataResponse)) != nil else {
                    debugPrint(">>>>>>>> Correto! Não conseguiu fazer o parse, pois objeto não é o de sucesso <<<<<<<<")
                    guard let errorResponse = try? JSONDecoder().decode(TwitterErrorResponseData.self, from: dataResponse) else {
                        XCTFail(">>>>>>>> Não conseguiu fazer o parse para o objeto de erro <<<<<<<<")
                        return
                    }
                    debugPrint(">>>>>>>> Correto! Usuário suspenso <<<<<<<<")
                    XCTAssertEqual(errorResponse.errors?.first?.title, "Forbidden")
                    e.fulfill()
                    return
                }
                XCTFail(">>>>>>>> Fez parse para objeto de sucesso e não deveria <<<<<<<<")
            }
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func testGetTwitterInvalidUser() {
        let e = expectation(description: "Alamofire")
        let userName = "testeprocurandousuario400"
        let request = TwitterUserRequest(userName: userName)
        
        AF.request(URL(string: request.path) ?? "", method: .get, encoding: JSONEncoding.default, headers: request.headers).responseData { (response) in
            if let dataResponse = response.data {
                guard (try? JSONDecoder().decode(TwitterUserResponseData.self, from: dataResponse)) != nil else {
                    debugPrint(">>>>>>>> Correto! Não conseguiu fazer o parse, pois objeto não é o de sucesso <<<<<<<<")
                    guard let errorResponse = try? JSONDecoder().decode(TwitterErrorResponseData.self, from: dataResponse) else {
                        XCTFail(">>>>>>>> Não conseguiu fazer o parse para o objeto de erro <<<<<<<<")
                        return
                    }
                    debugPrint(">>>>>>>> Correto! Usuário inválido perante validação regex server side <<<<<<<<")
                    XCTAssertEqual(errorResponse.errors?.first?.message, "The `username` query parameter value [\(userName)] does not match ^[A-Za-z0-9_]{1,15}$")
                    e.fulfill()
                    return
                }
                XCTFail(">>>>>>>> Fez parse para objeto de sucesso e não deveria <<<<<<<<")
            }
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func testGetTwitterUser() {
        let e = expectation(description: "Alamofire")
        
        let request = TwitterUserRequest(userName: "apple")
        
        AF.request(URL(string: request.path) ?? "", method: .get, encoding: JSONEncoding.default, headers: request.headers).responseData { (response) in
            if let dataResponse = response.data {
                guard let userResponse = try? JSONDecoder().decode(TwitterUserResponseData.self, from: dataResponse) else {
                    XCTFail(">>>>>>>> Não conseguiu fazer o parse para o objeto de sucesso <<<<<<<<")
                    return
                }
                XCTAssertEqual(userResponse.data.username, "Apple")
                e.fulfill()
            }
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }

}
