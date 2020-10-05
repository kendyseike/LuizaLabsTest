//
//  DocumentSentimentResponseData.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 04/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

struct DocumentSentimentResponseData: Codable {
    let documentSentiment: DocumentSentiment
    
    enum CodingKeys: String, CodingKey {
        case documentSentiment
    }
}
