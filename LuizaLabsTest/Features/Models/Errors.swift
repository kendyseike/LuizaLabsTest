//
//  Errors.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 04/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

struct Errors: Codable {
    var title: String?
    var message: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case message
    }
}
