//
//  SearchResponse.swift
//  iMusic
//
//  Created by Boris Goncharov on 7/16/20.
//  Copyright © 2020 Boris Goncharov. All rights reserved.
//

import Foundation

struct SearchResponse: Decodable {
    var resultCount: Int
    var results: [Track]
}

struct Track: Decodable {
    var trackName: String
    var collectionName: String?
    var artistName: String
    var artworkUrl100: String?
    var previewUrl: String?
}
