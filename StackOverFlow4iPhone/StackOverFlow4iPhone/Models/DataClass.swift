//
//  ParsingClass.swift
//  StackOverFlow4iPhone
//
//  Created by Anton Huisamen on 2018/10/01.
//  Copyright © 2018 antonsolo. All rights reserved.
//

import Foundation
import UIKit

class Data {
    
    func fetchMovieData(completion: @escaping (_ movieData: TableViewInfo?, _ error: Error?) -> Void) {
        let baseURL = URL(string: "https://api.stackexchange.com/docs/types/question")!
        let task = URLSession.shared.dataTask(with: baseURL) {(data, response, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let movieData = try decoder.decode(TableViewInfo.self, from: data)
                completion(movieData, nil)
            } catch {
                completion(nil, error)
            }
        }
        task.resume()
    }
}

