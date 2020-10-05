//
//  TwitterErrorResponseData.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 04/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

struct TwitterErrorResponseData: Codable {
    var errors: [Errors]?
    
    enum CodingKeys: String, CodingKey {
        case errors
    }
}
