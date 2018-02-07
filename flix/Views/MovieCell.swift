//
//  MovieCell.swift
//  flix
//
//  Created by Eli Scherrer on 1/10/18.
//  Copyright © 2018 Eli Scherrer. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    var movie: Movie? {
        didSet {
            titleLabel.text = movie?.title
            overviewLabel.text = movie?.overview
            posterImageView.af_setImage(withURL: (movie?.posterUrl)!)
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        titleLabel.preferredMaxLayoutWidth = titleLabel.frame.size.width
        overviewLabel.preferredMaxLayoutWidth = overviewLabel.frame.size.width
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        titleLabel.preferredMaxLayoutWidth = titleLabel.frame.size.width
        overviewLabel.preferredMaxLayoutWidth = overviewLabel.frame.size.width
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
