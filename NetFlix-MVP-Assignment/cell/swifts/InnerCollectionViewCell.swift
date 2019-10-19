//
//  InnerCollectionViewCell.swift
//  NetFlix-MVP-Assignment
//
//  Created by Waiphyoag on 10/17/19.
//  Copyright © 2019 Waiphyoag. All rights reserved.
//

import UIKit
import SDWebImage
class InnerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageViewMovie: UIImageView!
    
    var mData: MovieVO? {
        didSet {
            imageViewMovie.sd_setImage(with: URL(string:  "\(API.BASE_IMG_URL)\(mData?.poster_path ?? "")"), completed: nil)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
