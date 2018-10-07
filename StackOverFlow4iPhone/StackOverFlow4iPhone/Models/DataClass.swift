//
//  ParsingClass.swift
//  StackOverFlow4iPhone
//
//  Created by Anton Huisamen on 2018/10/01.
//  Copyright © 2018 antonsolo. All rights reserved.
//

import Foundation
import UIKit

struct QuestionHugo: Decodable {
    let title: String
}

struct QuestionsHugo: Decodable {
    let items: [QuestionHugo]
}

class Fetcher {
    func fetchAnswers(for query: String, completion: @escaping (_ questions: QuestionsHugo?,_ error: Error?) -> Void) {
        let queryString = createEncodedString(with: query)
        let url = URL(string: "http://api.stackexchange.com/2.2/questions?order=desc&sort=activity&tagged=\(queryString)&site=stackoverflow&filter=withbody")!
        print(url)
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completion(nil, error)
                return
            }
            do {
                let decoder = JSONDecoder()
                let items = try decoder.decode(QuestionsHugo.self, from: data)
                DispatchQueue.main.async {
                    completion(items, nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
            }.resume()
        
    }
    
    private func createEncodedString(with text: String) -> String {
        return text.replacingOccurrences(of: " ", with: ";")
    }
}


class DataFetcher {
    
    func fetch(completion: @escaping (_ questions: Questions?, _ error: Error?)-> Void){
        let baseURL = URL(string: "http://api.stackexchange.com/2.2/questions?order=desc&sort=activity&tagged=swift&site=stackoverflow&filter=withbody")!
         URLSession.shared.dataTask(with: baseURL) { (data, response, error) in
            guard let data = data else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let question = try decoder.decode(Questions.self, from: data)
                completion(question, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
}

