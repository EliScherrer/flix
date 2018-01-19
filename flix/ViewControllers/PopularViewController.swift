//
//  PopularViewController.swift
//  flix
//
//  Created by Eli Scherrer on 1/19/18.
//  Copyright © 2018 Eli Scherrer. All rights reserved.
//

import UIKit

class PopularViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var movies: [[String: Any]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        
        //programatically setup the layout/spacing/size of cells/images
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        let cellsPerLine: CGFloat = 2
        let spacingTotal = layout.minimumInteritemSpacing * (cellsPerLine - 1)
        let width = (collectionView.frame.size.width / cellsPerLine) - (spacingTotal / cellsPerLine)
        layout.itemSize = CGSize(width: width, height: width * 3 / 2)
        
        fetchPopular()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return movies.count
    }
    
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
        let movie = movies[indexPath.item]
        if let posterPathString = movie["poster_path"] as? String {
            let basePath = "https://image.tmdb.org/t/p/w500"
            let posterURL = URL(string: basePath + posterPathString)!
            cell.posterImageView.af_setImage(withURL: posterURL)
        }
        return cell
        
    }
    
    public func fetchPopular() {
//        self.activityIndicator.startAnimating()
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData , timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                let movies = dataDictionary["results"] as! [[String: Any]]
                self.movies = movies
                self.collectionView.reloadData()
//                self.refreshControl.endRefreshing()
//                self.activityIndicator.stopAnimating()
                
            }
        }
        
        task.resume()
    }
    
    
    
    
}
