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
    @IBOutlet weak var titleLabel: TopAlignedLabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: TopAlignedLabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    var movie: [String: Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        if let movie = movie {
            //dymaically set label values
            titleLabel.text = movie["title"] as? String
            releaseDateLabel.text = movie["release_date"] as? String
            overviewLabel.text = movie["overview"] as? String
            
            //adjust overview label size and scroll view if neccessary
            overviewLabel.sizeToFit()
            let contentHeight = overviewLabel.frame.height + 390
            let contentWidth = scrollView.bounds.width
            scrollView.contentSize = CGSize(width: contentWidth, height: contentHeight)


            //setup images
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

//class for top left alligned text labels
@IBDesignable class TopAlignedLabel: UILabel {
    override func drawText(in rect: CGRect) {
        if let stringText = text {
            let stringTextAsNSString = stringText as NSString
            let labelStringSize = stringTextAsNSString.boundingRect(with: CGSize(width: self.frame.width,height: CGFloat.greatestFiniteMagnitude),
                                                                    options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                                                    attributes: [NSAttributedStringKey.font: font],
                                                                    context: nil).size
            super.drawText(in: CGRect(x:0,y: 0,width: self.frame.width, height:ceil(labelStringSize.height)))
        } else {
            super.drawText(in: rect)
        }
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }
}


