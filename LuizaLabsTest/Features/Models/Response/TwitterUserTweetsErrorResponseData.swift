//
//  TwitterUserTweetsErrorResponseData.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 05/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

struct TwitterUserTweetsErrorResponseData: Codable {
    let meta: Meta
    
    private enum CodingKeys: String, CodingKey {
        case meta
    }
}
