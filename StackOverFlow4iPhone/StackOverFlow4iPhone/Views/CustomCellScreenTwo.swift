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
    @IBOutlet weak var checkMark: UIImageView!
    

    
    func fillCell(question: Question){
        questionLabel.text = question.title
        askedByLabel.text = question.owner.display_name
        votesLabel.text = "\(question.score) Votes"
        answersLabel.text = "\(question.answer_count) answers"
        viewsLabel.text = "\(question.view_count) views"
        var answer: Bool = question.is_answered
        checkMark.isHidden = true
        if answer == true {
            checkMark.isHidden = false
        }
    }
}
