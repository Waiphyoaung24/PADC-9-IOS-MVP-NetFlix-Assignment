//
//  HomeDetailPresenterImpl.swift
//  NetFlix-MVP-Assignment
//
//  Created by Waiphyoag on 10/17/19.
//  Copyright © 2019 Waiphyoag. All rights reserved.
//

import Foundation
import RealmSwift
class MovieDetailPresenterImpl : BasePresenter {
    
    var mView : MovieDetailView? = nil
    
    var movieDetail : MovieDetailResponse?
    
    var movideDetailVO: MovieDetailVO?
    
    var similarMovies: [MovieInfoResponse]?
    
    let realm = try! Realm()
    
    var movieId = 0
}
extension MovieDetailPresenterImpl : MovieDetailPresenter {
    func onUIReady(movieId: Int) {
        self.movieId = movieId
        FetchData()
        
    }
    
    func onAttachView(view: MovieDetailView) {
        mView = view
    }
    

func FetchData () {
    if NetworkUtils.checkReachable() == false {
        
        let movie = realm.object(ofType: MovieDetailVO.self, forPrimaryKey: movieId)
        
        if let mMovie = movie {
            
            self.movideDetailVO = mMovie
            
            self.mView?.showDetailFromDB()
            
        } else {
            mView?.showNoInternetError()
        }
        
    } else {
        
        fetchMovieDetail()
        fetchSimilarMovieList()
        
    }

}
    
    fileprivate func fetchMovieDetail() {
        
        if NetworkUtils.checkReachable() == false {
            mView?.showNoInternetError()
            return
        }
        
        MovieDetailModelImpl.shared.fetchMovieDetailByIdFromApi(movieId: self.movieId, success: { (movieDetail) in
            
            DispatchQueue.main.async {
                [weak self] in
                
                if self?.realm != nil {
                    MovieDetailResponse.saveMovieDetail(data: movieDetail, realm: self!.realm)
                }
                
                self?.movieDetail = movieDetail
                
                self?.mView?.showDetail()
            }
            
        }) { (error) in
            print(error)
        }
        
    }
    
    fileprivate func fetchSimilarMovieList() {
        
        if NetworkUtils.checkReachable() == false {
            mView?.showNoInternetError()
            return
        }
        
        MovieModelImpl.shared.fetchSimilarMoviesFromApi(movieId: self.movieId, success: { (movies) in
            
            self.similarMovies = movies
            
            self.mView?.showSimilarMovies()
            
        }) { (error) in
            print(error)
        }
        
    }
}
