//
//  AnalyzeSentimentTests.swift
//  LuizaLabsTestTests
//
//  Created by Kendy Nagao on 05/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

import XCTest
@testable import LuizaLabsTest

class AnalyzeSentimentTests: XCTestCase {
    
    func testAnalyzeSentimentHappy() {
        XCTAssertEqual(AnalyzeSentiment().getSentiment(score: 0.5), TextSentiment.happy)
    }
    
    func testAnalyzeSentimentNeutral() {
        XCTAssertEqual(AnalyzeSentiment().getSentiment(score: 0.0), TextSentiment.neutral)
    }
    
    func testAnalyzeSentimentSad() {
        XCTAssertEqual(AnalyzeSentiment().getSentiment(score: -0.5), TextSentiment.sad)
    }
}
