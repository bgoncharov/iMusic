//
//  CMTime + Extension.swift
//  iMusic
//
//  Created by Boris Goncharov on 7/20/20.
//  Copyright © 2020 Boris Goncharov. All rights reserved.
//

import Foundation
import AVKit

extension CMTime {
    func toDisplayString() -> String {
        guard !CMTimeGetSeconds(self).isNaN else { return "" }
        let totalSeconds = Int(CMTimeGetSeconds(self))
        let seconds = totalSeconds % 60
        let minutes = seconds / 60
        let timeFormatString = String(format: "%02d:%02d", minutes, seconds)
        return timeFormatString
    }
}
