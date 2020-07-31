//
//  MovieVIewModel.swift
//  MVVMDemo
//
//  Created by mac on 13/03/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class MovieViewModel: NSObject {
    var artistName:String
    var trackName:String
    init(movie:MovieModal) {
        self.artistName = movie.artistName
        self.trackName = movie.trackName
    }
}

class Service: NSObject {
    static var sharedInstance = Service()
    var arrMovieData = [MovieModal]()
    func getMovieData(completion: @escaping([MovieModal]?, Error?) -> () ){
        guard let url = URL(string: "https://itunes.apple.com/search?media=music&term=bollywood") else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error {
                completion(nil, err)
                print("error : \(err.localizedDescription)")
            } else {
                guard let Jsondata = data else {return}
                do {
                    let result = try JSONDecoder().decode(ResultModal.self, from: Jsondata)
                    
                    for movie in result.results {
                        self.arrMovieData.append(MovieModal.init(artistName: movie.artistName, trackName: movie.trackName))
                    }
                    //print(self.arrMovieData)
                    completion(self.arrMovieData, nil)
                }
                catch let error {
                    print("error : \(error)")
                }
            }
            }.resume()
    }
}

