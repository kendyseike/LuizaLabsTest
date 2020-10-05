//
//  Meta.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 05/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

struct Meta: Codable {
    let result_count: Int
    
    enum CodingKeys: String, CodingKey {
        case result_count
    }
}
