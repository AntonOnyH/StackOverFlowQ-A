//
//  CustomCellSCR02TableViewCell.swift
//  StackOverFlow4iPhone
//
//  Created by Anton Huisamen on 2018/10/01.
//  Copyright © 2018 antonsolo. All rights reserved.
//

import UIKit

class CustomCellScreenTwo: UITableViewCell {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var askedByLabel: UILabel!
    @IBOutlet weak var votesLabel: UILabel!
    @IBOutlet weak var answersLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    
    let questionsDetails = QuestionsDetails(title: "What's this", body: "And the rest", questionId: 55, creationDate: 12032010, displayName: "Mr SoandSo", score: 77, answersCount: 2, viewCount: 312, isAnswered: true, tags: [Tag(tagOne: "swift", tagTwo: "ios", tagThree: "", tagFour: "", tagFive: "")])

    
    func fillCell(){
        questionLabel.text = questionsDetails.title
        askedByLabel.text = "asked by \(questionsDetails.questionId)"
        votesLabel.text = "\(questionsDetails.viewCount) Views"
        answersLabel.text = "\(questionsDetails.answersCount) answers"
        viewsLabel.text = "\(questionsDetails.viewCount) views"
    }
   
    
}
