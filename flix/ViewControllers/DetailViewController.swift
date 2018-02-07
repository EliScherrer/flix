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
    
    
    var movie: Movie?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        if let movie = movie {
            //dymaically set label values
            titleLabel.text = movie.title
            releaseDateLabel.text = movie.releaseDate
            overviewLabel.text = movie.overview
            
            //adjust overview label size and scroll view if neccessary
//            overviewLabel.sizeToFit()
//            let contentHeight = overviewLabel.frame.height + 390
//            let contentWidth = scrollView.bounds.width
//            scrollView.contentSize = CGSize(width: contentWidth, height: contentHeight)


            //setup images
            backDropImageView.af_setImage(withURL: movie.backdropUrl!)
            backDropImageView.layer.zPosition = -5;
            
            posterImageView.af_setImage(withURL: movie.posterUrl!)
            
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


