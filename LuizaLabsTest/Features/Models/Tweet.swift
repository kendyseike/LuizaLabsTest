//
//  Tweets.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 04/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

struct Tweet: Codable {
    let id: String
    let text: String
    var sentiment: TextSentiment?
    var analyzing: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id
        case text
    }
}
