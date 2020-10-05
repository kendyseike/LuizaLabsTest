//
//  HttpMethod.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 04/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

enum HttpMethod {
    case get
    case post
    case put
    case delete
}

extension HttpMethod {
    var method: String {
        switch self {
            case .get:    return "GET"
            case .post:   return "POST"
            case .put:    return "PUT"
            case .delete: return "DELETE"
        }
    }
}
