//
//  SearchViewController.swift
//  iMusic
//
//  Created by Boris Goncharov on 7/15/20.
//  Copyright © 2020 Boris Goncharov. All rights reserved.
//

import UIKit
import Alamofire

struct TrackModel {
    var trackName: String
    var artistName: String
}


class SearchViewController: UITableViewController {
    
    private var timer: Timer?
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var tracks = [Track]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupSearchBar()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    }
    
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        let track = tracks[indexPath.row]
        cell.textLabel?.text = "\(track.trackName)\n\(track.artistName)"
        cell.textLabel?.numberOfLines = 2
        cell.imageView?.image = #imageLiteral(resourceName: "cover_domo_2")
        return cell
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        print(searchText)
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            
            let url = "https://itunes.apple.com/search?term=\(searchText)"
            let parameters = ["term":"\(searchText)",
                "limit":"10"]
            
            AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
                
                if let error = dataResponse.error {
                    print("Error: \(error.localizedDescription)")
                }
                
                guard let data = dataResponse.data else { return }
                
                let decoder = JSONDecoder()
                
                do {
                    let object = try decoder.decode(SearchResponse.self, from: data)
                    print("objects: ", object)
                    self.tracks = object.results
                    self.tableView.reloadData()
                } catch let jsonError {
                    print("JSON Error: ", jsonError.localizedDescription)
                }
                
                //                let someString = String(data: data, encoding: .utf8)
                //                print(someString ?? "")
            }
        })
    }
}
