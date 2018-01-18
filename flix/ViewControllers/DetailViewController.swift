//
//  DetailViewController.swift
//  flix
//
//  Created by Eli Scherrer on 1/17/18.
//  Copyright © 2018 Eli Scherrer. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var backDropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var movie: [String: Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let movie = movie {
            titleLabel.text = movie["title"] as? String
            releaseDateLabel.text = movie["release_date"] as? String
            overviewLabel.text = movie["overview"] as? String
            
            let backdropPath = movie["backdrop_path"] as! String
            let posterPath = movie["poster_path"] as! String
            let basePath = "https://image.tmdb.org/t/p/w500"
            
            let backdropURL = URL(string: basePath + backdropPath)!
            backDropImageView.af_setImage(withURL: backdropURL)
            
            let posterURL = URL(string: basePath + posterPath)!
            posterImageView.af_setImage(withURL: posterURL)
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
