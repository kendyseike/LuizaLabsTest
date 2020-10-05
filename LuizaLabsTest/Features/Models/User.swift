//
//  User.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 04/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

struct User: Codable {
    let id: String
    var name: String
    let username: String
    var tweets: [Tweet]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case username
        case tweets
    }
}
