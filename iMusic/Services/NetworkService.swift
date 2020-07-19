//
//  NetworkService.swift
//  iMusic
//
//  Created by Boris Goncharov on 7/17/20.
//  Copyright © 2020 Boris Goncharov. All rights reserved.
//

import UIKit
import Alamofire

class NetworkService {
    func fetchTracks(searchText: String, completion: @escaping (SearchResponse?) -> Void) {
        let url = "https://itunes.apple.com/search?term=\(searchText)"
        let parameters = ["term":"\(searchText)",
            "limit":"100",
            "media":"music"]
        
        AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
            
            if let error = dataResponse.error {
                print("Error: \(error.localizedDescription)")
                completion(nil)
            }
            
            guard let data = dataResponse.data else { return }
            
            let decoder = JSONDecoder()
            
            do {
                let object = try decoder.decode(SearchResponse.self, from: data)
                print("objects: ", object)
                completion(object)
            } catch let jsonError {
                print("JSON Error: ", jsonError.localizedDescription)
                completion(nil)
            }
            
            //                let someString = String(data: data, encoding: .utf8)
            //                print(someString ?? "")
        }
    }
}
