//
//  TrackDetailView.swift
//  iMusic
//
//  Created by Boris Goncharov on 7/19/20.
//  Copyright © 2020 Boris Goncharov. All rights reserved.
//

import UIKit

class TrackDetailView: UIView {
    
    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var currentTimeSlider: UISlider!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var durationTimeLabel: UILabel!
    @IBOutlet weak var trackTitleLabel: UILabel!
    @IBOutlet weak var authorTitleLabel: UILabel!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var volumeSlider: UISlider!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .blue
    }
    
    @IBAction func dragDownButtonTapped(_ sender: Any) {
    }
    
    @IBAction func handleCurrentTimerSlider(_ sender: Any) {
    }
    
    @IBAction func handleVolumeSlider(_ sender: Any) {
    }
    
    @IBAction func previousTrack(_ sender: Any) {
    }
    
    @IBAction func nextTrack(_ sender: Any) {
    }
    
    @IBAction func playPauseAction(_ sender: Any) {
    }
    
}
