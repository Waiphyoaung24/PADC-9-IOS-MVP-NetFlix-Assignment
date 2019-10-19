//
//  SimilarMovieTableViewCell.swift
//  NetFlix-MVP-Assignment
//
//  Created by Waiphyoag on 10/17/19.
//  Copyright © 2019 Waiphyoag. All rights reserved.
//

import UIKit

class SimilarMovieTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionViewSimilarMovies: UICollectionView!
    
    var mData : [MovieInfoResponse]? {
        didSet {
            collectionViewSimilarMovies.reloadData()
        }
    }
    
    var delegate : MovieDetailDelegate?

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let flowLayout = self.collectionViewSimilarMovies.collectionViewLayout as! UICollectionViewFlowLayout
        
        collectionViewSimilarMovies.delegate = self
        collectionViewSimilarMovies.dataSource = self
        collectionViewSimilarMovies.collectionViewLayout = flowLayout
        collectionViewSimilarMovies.backgroundColor = .none
        collectionViewSimilarMovies.backgroundView = nil
        
        collectionViewSimilarMovies.registerForCollectionCell(strID: String(describing: SimilarMovieCollectionViewCell.self))
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension SimilarMovieTableViewCell : UICollectionViewDelegate {
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.showMovieDetail(movieId: self.mData?[indexPath.row].id ?? 0)
    }
}
extension SimilarMovieTableViewCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SimilarMovieCollectionViewCell.self), for: indexPath) as! SimilarMovieCollectionViewCell
        item.mData = self.mData?[indexPath.row]
        return item
    }
    
    
}
extension SimilarMovieTableViewCell : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.bounds.width * (1/3)
        return CGSize(width: width, height: width + (width/2))
    }
    
}
