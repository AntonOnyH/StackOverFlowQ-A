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
    @IBOutlet weak var reputationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var iosSwiftLabel: UILabel!
    
    var screenThreeDetails: Question?

    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = screenThreeDetails?.title
        questionTextView.attributedText = screenThreeDetails?.body.htmlToAttributedString
        nameLabel.text = screenThreeDetails?.owner.display_name
        let rep: Int = screenThreeDetails?.owner.reputation ?? 0
        reputationLabel.text = "\(rep)"
        dateLabel.text = convertDate(datenumber: screenThreeDetails?.creation_date)
//        iosSwiftLabel.text = screenThreeDetails.tags
        
        navigationController?.navigationBar.tintColor = .white

    }

    func convertDate(datenumber: Int?) -> String {
        guard let d = datenumber else {return ""}
        let date = Date(timeIntervalSince1970: TimeInterval(d))
        return "\(date)"
    }
    }

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
}
    


