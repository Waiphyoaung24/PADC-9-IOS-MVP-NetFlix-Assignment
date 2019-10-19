//
//  MovieDetailViewController.swift
//  NetFlix-MVP-Assignment
//
//  Created by Waiphyoag on 10/17/19.
//  Copyright © 2019 Waiphyoag. All rights reserved.
//

import UIKit
import SDWebImage
import RealmSwift

class MovieDetailViewController: UIViewController {
    
    
    @IBOutlet weak var similarcollectionView: UICollectionView!
    
    @IBOutlet weak var ivBackground: UIImageView!
    @IBOutlet weak var ivMovie: UIImageView!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblDuration: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnRate: UIButton!
    @IBOutlet weak var btnWatchList: UIButton!
    @IBOutlet weak var lblMovieDetail: UILabel!
    
    @IBOutlet weak var tableViewMovieDetail: UITableView!
    let mPresenter = MovieDetailPresenterImpl()

    
    
    var movieId : Int? {
        didSet {
            
            self.mPresenter.onUIReady(movieId: movieId ?? 0)
        }
    }
   
    
    var delegate : MovieDetailDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableViewMovieDetail.delegate = self
//        tableViewMovieDetail.dataSource = self
//        tableViewMovieDetail.separatorStyle = .none
//        tableViewMovieDetail.backgroundColor = UIColor.clear
        self.navigationItem.hidesBackButton = true;

        let flowLayout = similarcollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        similarcollectionView.delegate = self
        similarcollectionView.dataSource = self
       
        similarcollectionView.collectionViewLayout = flowLayout

        similarcollectionView.registerForCollectionCell(strID: String(describing: SimilarMovieCollectionViewCell.self))
        
        
        mPresenter.onAttachView(view: self)
    
    
    }

    
    @IBAction func onTapClose(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension MovieDetailViewController : MovieDetailDelegate {
    func showMovieDetail(movieId: Int) {
        self.movieId = movieId
        mPresenter.onUIReady(movieId: movieId)
    }
    
}
extension MovieDetailViewController : MovieDetailView {
    func showDetail() {
        self.ivBackground.sd_setImage(with: URL(string:  "\(API.BASE_IMG_URL)\(self.mPresenter.movieDetail?.poster_path ?? "")"), completed: { (image, error, cachetype, url) in
            
            self.ivBackground.image = image?.blurred(radius: 20)
            self.ivMovie.image = image
           self.lblMovieDetail.text = self.mPresenter.movieDetail?.overview
            
            

            
    })
    }
    
    func showDetailFromDB() {
        
         lblMovieDetail.text = self.mPresenter.movideDetailVO?.overview
    }
    
    func showSimilarMovies() {
        self.similarcollectionView.reloadData()

    }
    
    func showNoInternetError() {
        Dialog.showAlert(viewController: self, title: "Error", message: "No off line data available!")

    }
    
    
}

//extension MovieDetailViewController : UITableViewDataSource {
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let width = tableView.bounds.width * (1/3)
//        return width + 100
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//
//

//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CustomHeaderTableViewCell.self)) as! CustomHeaderTableViewCell
//        cell.backgroundView = nil
//        cell.headerTitle = "More Like This"
//        return cell
//    }
    
    /*
     To set background color of tableviewcell
     */
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        
//        cell.backgroundColor = UIColor.clear
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//       
//        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SimilarMovieTableViewCell.self), for: indexPath) as! SimilarMovieTableViewCell
//
//        cell.mData = self.mPresenter.similarMovies
//        cell.delegate = self
//
//        return cell
//        }
//
//    
//}
//extension MovieDetailViewController : UITableViewDelegate{
//    
//}

extension MovieDetailViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       let movieId = mPresenter.similarMovies?[indexPath.row].id ?? 0
        mPresenter.onUIReady(movieId: movieId)
    }
    
}
extension MovieDetailViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mPresenter.similarMovies?.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SimilarMovieCollectionViewCell.self), for: indexPath) as! SimilarMovieCollectionViewCell
        item.mData = mPresenter.similarMovies?[indexPath.row]
        return item
    }
    }
    
    

extension MovieDetailViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.bounds.width * (1/3)
        return CGSize(width: width, height: 280)
    }
    
}
