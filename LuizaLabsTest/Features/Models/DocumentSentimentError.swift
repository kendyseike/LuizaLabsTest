//
//  DocumentSentimentError.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 05/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

struct DocumentSentimentError: Codable {
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case message
    }
}
