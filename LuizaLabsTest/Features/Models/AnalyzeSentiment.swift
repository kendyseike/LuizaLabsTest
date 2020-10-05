//
//  AnalyzeSentiment.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 05/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

struct AnalyzeSentiment {
    func getSentiment(score: Float) -> TextSentiment {
        switch score {
        case _ where score < 0.0:
            return TextSentiment.sad
        case _ where score > 0.0:
            return TextSentiment.happy
        default:
            return TextSentiment.neutral
        }
    }
}
