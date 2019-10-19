//
//  MovieListCollectionViewCell.swift
//  NetFlix-MVP-Assignment
//
//  Created by Waiphyoag on 10/17/19.
//  Copyright © 2019 Waiphyoag. All rights reserved.
//


import UIKit
import SDWebImage

class MovieListCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var ivPoster: UIImageView!
    
    
    var data : MovieVO? {
        didSet {
            if let data = data {
                ivPoster.sd_setImage(with: URL(string: "\(API.BASE_IMG_URL)\(data.poster_path ?? "")"), completed: nil)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static var identifier : String {
        return String(describing: self)
    }
}
