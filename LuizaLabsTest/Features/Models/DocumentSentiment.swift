//
//  DocumentSentiment.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 04/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

struct DocumentSentiment: Codable {
    let magnitude: Float
    let score: Float
    
    enum CodingKeys: String, CodingKey {
        case magnitude
        case score
    }
}
