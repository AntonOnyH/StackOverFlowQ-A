//
//  ParsingModels.swift
//  StackOverFlow4iPhone
//
//  Created by Anton Huisamen on 2018/10/01.
//  Copyright © 2018 antonsolo. All rights reserved.
//

import Foundation
import UIKit

struct Question: Decodable{
    var title: String
    var score: Int
    var answer_count: Int
    var view_count: Int
    var link: String
    var body: String
    var creation_date: Int
    var is_answered: Bool
    var owner: Owner
//    var tags: ["key" : Tag]
}

struct Owner: Decodable {
    var profile_image: String?
    var reputation: Int?
    var display_name: String

}

struct Questions: Decodable {
    let items: [Question]
}

struct QuestionDetails {
    var title: String
  
}

struct Tag: Decodable {
    var tag: String
}


