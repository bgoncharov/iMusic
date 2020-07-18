//
//  TrackCell.swift
//  iMusic
//
//  Created by Boris Goncharov on 7/17/20.
//  Copyright © 2020 Boris Goncharov. All rights reserved.
//

import UIKit

class TrackCell: UITableViewCell {
    
    @IBOutlet weak var trackImageView: UIImageView!
    
    static let reuseId = "trackCellId"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
