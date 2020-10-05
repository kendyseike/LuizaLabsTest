//
//  TweetsFromUserRequest.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 04/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

import Foundation
import Alamofire

class TweetsFromUserRequest {
    var tweetsIds: [String]
    
    public init(tweetsIds: [String]) {
        self.tweetsIds = tweetsIds
    }
    
    var path: String {
        let idsToString = tweetsIds.joined(separator: ",")
        return "https://api.twitter.com/2/tweets?ids=\(idsToString)"
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
