//
//  ParsingModels.swift
//  StackOverFlow4iPhone
//
//  Created by Anton Huisamen on 2018/10/01.
//  Copyright © 2018 antonsolo. All rights reserved.
//

import Foundation
import UIKit

struct QuestionsDetails {
    var title: String
    var body: String
    var questionId: Int
    var creationDate: Int
    var displayName: String
    var score: Int
    var answersCount: Int
    var viewCount: Int
    var isAnswered: Bool
    var tags: [Tag]
}

struct Tag {
    var tagOne: String
    var tagTwo: String?
    var tagThree: String?
    var tagFour: String?
    var tagFive: String?
}

extension QuestionsDetails {
    enum codingKeys: String, CodingKey {
        case title = "title"
        case body = "body"
        case questionId = "question_id"
        case creationDate = "creation_date"
        case displayName = "display_name"
        case score = "score"
        case answersCount = "answers_count"
        case viewCount = "view_count"
        case isAnswered = "is_answered"
        case tags = "tags"
    }
}
