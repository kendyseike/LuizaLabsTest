//
//  TwitterUserTweetsResponseData.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 04/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

struct TwitterUserTweetsResponseData: Codable {
    let data: [Tweet]
    
    private enum CodingKeys: String, CodingKey {
        case data
    }
}
