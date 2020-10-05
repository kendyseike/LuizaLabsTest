//
//  TwitterUserResponseData.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 04/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

struct TwitterUserResponseData: Codable {
    let data: User
    
    enum CodingKeys: String, CodingKey {
        case data
    }    
}
