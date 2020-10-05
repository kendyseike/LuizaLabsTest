//
//  DocumentSentimentErrorResponseData.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 05/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

struct DocumentSentimentErrorResponseData: Codable {
    let error: DocumentSentimentError
    
    enum CodingKeys: String, CodingKey {
        case error
    }
}
