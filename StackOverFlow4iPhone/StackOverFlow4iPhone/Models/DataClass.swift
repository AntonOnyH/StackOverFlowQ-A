//
//  ParsingClass.swift
//  StackOverFlow4iPhone
//
//  Created by Anton Huisamen on 2018/10/01.
//  Copyright © 2018 antonsolo. All rights reserved.
//

import Foundation
import UIKit

class DataFetcher {
    
    func fetch(query: String, completion: @escaping (_ questions: Questions?, _ error: Error?)-> Void) {
        
        let baseURL = URL(string: "http://api.stackexchange.com/2.2/questions?order=desc&sort=activity&tagged=\(query)&site=stackoverflow&filter=withbody")!
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

