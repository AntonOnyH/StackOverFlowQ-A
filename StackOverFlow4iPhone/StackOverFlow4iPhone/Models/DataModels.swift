//
//  ParsingModels.swift
//  StackOverFlow4iPhone
//
//  Created by Anton Huisamen on 2018/10/01.
//  Copyright © 2018 antonsolo. All rights reserved.
//

import Foundation
import UIKit

struct TableViewInfo: Codable {
    var title: String
    var displayName: String
    var score: Int
    var answersCount: Int
    var viewCount: Int
    var isAnswered: Bool
}

extension TableViewInfo {
    enum codingKeys: String, CodingKey {
        case title = "title"
        case displayName = "display_name"
        case score = "score"
        case answersCount = "answers_count"
        case viewCount = "view_count"
        case isAnswered = "is_answered"
    }
}
