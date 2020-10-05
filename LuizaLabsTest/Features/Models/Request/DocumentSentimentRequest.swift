//
//  DocumentSentimentRequest.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 04/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

import Foundation
import Alamofire

class DocumentSentimentRequest {
    var plainText = "PLAIN_TEXT"
    var content: String
    let encoding = "UTF8"
    
    public init(content: String, documentType: String? = "PLAIN_TEXT") {
        self.content = content
        self.plainText = documentType ?? "PLAIN_TEXT"
    }
    
    var path: String {
        return "https://language.googleapis.com/v1/documents:analyzeSentiment?key=\(SecretKeys.GoogleCloudSecretKey)"
    }
    
    public var headers: HTTPHeaders {
        let customHeaders: HTTPHeaders = [
            HTTPHeader(name: "X-Ios-Bundle-Identifier", value: Bundle.main.bundleIdentifier ?? ""),
            .contentType("application/json")
        ]
        return customHeaders
    }
    
    var httpMethod: HttpMethod {
        return .post
    }
    
    public func parseDictionaryRequestBody() -> [String : Any] {
        return [
                "document" : ["type" : self.plainText,
                              "content" : self.content
                             ],
                "encodingType" : self.encoding
                ]
    }
}
