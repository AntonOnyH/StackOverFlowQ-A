//
//  SCR02ViewController.swift
//  StackOverFlow4iPhone
//
//  Created by Anton Huisamen on 2018/10/01.
//  Copyright © 2018 antonsolo. All rights reserved.
//

import UIKit

class ScreenTwo: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var questionsTableView: UITableView!
    @IBOutlet weak var emptyStateLabel: UILabel!
    let fetcher = DataFetcher()
    
    var items: [Question] = []{
        didSet {
            DispatchQueue.main.async {
                self.questionsTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionsTableView.register(UINib(nibName: "CustomCellScreenTwo", bundle: nil), forCellReuseIdentifier: "Cell")
        questionsTableView.dataSource = self
        questionsTableView.delegate = self
        searchBar.delegate = self
        navigationItem.titleView = searchBar
    }
    
}

extension ScreenTwo: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        cell.fillCell(question: items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "SCR03") as! ScreenThree
        controller.screenThreeDetails = items[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension ScreenTwo: UISearchBarDelegate{
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        emptyStateLabel.isHidden = true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        fetcher.fetch(query: searchBar.text ?? "") { (questions, error) in
            guard let questions = questions else {return}
            self.items = questions.items
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == ""{
            items = []
        }
    }
}

