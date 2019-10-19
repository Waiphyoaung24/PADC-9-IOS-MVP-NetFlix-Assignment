//
//  OuterMovieTableViewCell.swift
//  NetFlix-MVP-Assignment
//
//  Created by Waiphyoag on 10/17/19.
//  Copyright © 2019 Waiphyoag. All rights reserved.
//

import UIKit

class OuterMovieTableViewCell: UITableViewCell {

    @IBOutlet weak var innerCollectionView: UICollectionView!
//
    var mData: [MovieVO]? {

        didSet {
            innerCollectionView.reloadData()

        }
    }
    var delegate: MovieDetailDelegate?

    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        let flowLayout = self.innerCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        innerCollectionView.dataSource = self
        innerCollectionView.delegate = self
        innerCollectionView.collectionViewLayout = flowLayout
        
        innerCollectionView.registerForCollectionCell(strID: String(describing: InnerCollectionViewCell.self))
        
        selectionStyle = .none
    }

    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
extension OuterMovieTableViewCell : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.showMovieDetail(movieId: mData?[indexPath.row].id ?? 0)
    }
    
}

extension OuterMovieTableViewCell : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: InnerCollectionViewCell.self), for: indexPath) as! InnerCollectionViewCell
        cell.mData = self.mData?[indexPath.row]
        return cell
    }
    
    
}
extension OuterMovieTableViewCell : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
          let width = collectionView.bounds.width * 1/3.5;
       
        
        return CGSize(width: width, height: width + (width/2))

    }
}
