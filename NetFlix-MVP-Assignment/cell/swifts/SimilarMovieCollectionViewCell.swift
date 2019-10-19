//
//  SimilarMovieCollectionViewCell.swift
//  NetFlix-MVP-Assignment
//
//  Created by Waiphyoag on 10/17/19.
//  Copyright © 2019 Waiphyoag. All rights reserved.
//

import UIKit
import SDWebImage
class SimilarMovieCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var ivMovieDetail: UIImageView!
    
    var mData: MovieInfoResponse? {
        didSet {
            ivMovieDetail.sd_setImage(with: URL(string:  "\(API.BASE_IMG_URL)\(mData?.poster_path ?? "")"), completed: nil)
            
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
