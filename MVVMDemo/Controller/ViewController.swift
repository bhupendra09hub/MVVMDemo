//
//  ViewController.swift
//  MVVMDemo
//
//  Created by mac on 12/03/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tblMovie: UITableView!
    var arrMovieVM = [MovieViewModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func getData() {
        Service.sharedInstance.getMovieData { (movies, error) in
            if (error==nil) {
                self.arrMovieVM = movies?.map({return MovieViewModel(movie: $0)}) ?? []
                DispatchQueue.main.async {
                    self.tblMovie.reloadData()
                }
            }
        }
    }
}

extension ViewController:UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMovieVM.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arrMovieVM[indexPath.row].artistName
        cell.detailTextLabel?.text = arrMovieVM[indexPath.row].trackName
        return cell
    }
}

