//
//  SCR03ViewController.swift
//  StackOverFlow4iPhone
//
//  Created by Anton Huisamen on 2018/10/01.
//  Copyright © 2018 antonsolo. All rights reserved.
//

import UIKit

class ScreenThree: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionTextView: UITextView!
    @IBOutlet weak var stackImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var iosSwiftLabel: UILabel!
    
    let screenThreeDetails = QuestionsDetails(title: "What's this", body: "And the rest", questionId: 55, creationDate: 12032010, displayName: "Mr SoandSo", score: 77, answersCount: 2, viewCount: 312, isAnswered: true, tags: [Tag(tagOne: "swift", tagTwo: "ios", tagThree: "", tagFour: "", tagFive: "")])
    var tagDetails: String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = screenThreeDetails.title
        questionTextView.text = screenThreeDetails.body
        nameLabel.text = "\(screenThreeDetails.questionId)"
        numberLabel.text = "\(screenThreeDetails.viewCount)"
        dateLabel.text = "\(screenThreeDetails.creationDate)"
//        iosSwiftLabel.text = screenThreeDetails.tags
    }

  
    }
    


