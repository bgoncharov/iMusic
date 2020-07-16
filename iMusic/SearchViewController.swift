//
//  SearchViewController.swift
//  iMusic
//
//  Created by Boris Goncharov on 7/15/20.
//  Copyright © 2020 Boris Goncharov. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController {
    
    struct TrackModel {
        var trackName: String
        var artistName: String
    }
    
    let tracks = [TrackModel(trackName: "TNT", artistName: "AC/DC"), TrackModel(trackName: "Yesterday", artistName: "Beatles")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
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
