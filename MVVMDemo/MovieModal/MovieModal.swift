//
//  MovieModal.swift
//  MVVMDemo
//
//  Created by mac on 13/03/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class MovieModal: Decodable {
    var artistName:String
    var trackName:String
    init(artistName:String, trackName:String) {
        self.artistName = artistName
        self.trackName = trackName
    }
}
class ResultModal:Decodable {
    var results = [MovieModal]()
    init(results:[MovieModal]) {
        self.results = results
    }
}
