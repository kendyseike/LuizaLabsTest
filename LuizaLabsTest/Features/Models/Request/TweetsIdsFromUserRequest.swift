//
//  TweetsFromUserRequest.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 04/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

import Foundation
import Alamofire

class TweetsIdsFromUserRequest {
    var userName: String
    
    public init(userName: String) {
        self.userName = userName
    }
    
    var path: String {
        return "https://api.twitter.com/2/tweets/search/recent?query=from:\(self.userName)"
    }
    
    public var headers: HTTPHeaders {
        let customHeaders: HTTPHeaders = [
            HTTPHeader(name: "Authorization", value: SecretKeys.TwitterBearerToken)
        ]
        return customHeaders
    }
    
    var httpMethod: HttpMethod {
        return .get
    }
}
