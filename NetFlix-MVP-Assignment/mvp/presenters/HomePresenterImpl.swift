//
//  HomePresenterImpl.swift
//  NetFlix-MVP-Assignment
//
//  Created by Waiphyoag on 10/17/19.
//  Copyright © 2019 Waiphyoag. All rights reserved.
//

import Foundation
import RealmSwift

class HomePresenterImpl : BasePresenter {

    var mView : HomeView? = nil
    
    let realm = try! Realm()

    var movieList : Results<MovieVO>?
    
    var nowShowingMovieList : [MovieVO]?
    
    var upComingMovieList : [MovieVO]?
    
    var trendingMovieList : [MovieVO]?
    
    var topRatedMovieList : [MovieVO]?
    
    private var movieListNotifierToken : NotificationToken?
    
    deinit {
        movieListNotifierToken?.invalidate()
    }
}

extension HomePresenterImpl : HomePresenter {
    
    func onUIReady() {
        
        movieList = realm.objects(MovieVO.self)
        
        movieListNotifierToken = movieList?.observe{ [weak self] changes in
            
            self?.nowShowingMovieList = self?.movieList?.filter(NSPredicate(format: "now_showing == %@", NSNumber(value: true))).map({$0}) ?? []
            
            self?.upComingMovieList = self?.movieList?.filter(NSPredicate(format: "up_coming == %@", NSNumber(value: true))).map({$0}) ?? []
            
            self?.trendingMovieList = self?.movieList?.filter(NSPredicate(format: "trending == %@", NSNumber(value: true))).map({$0}) ?? []
            
            self?.topRatedMovieList = self?.movieList?.filter(NSPredicate(format: "top_rated == %@", NSNumber(value: true))).map({$0}) ?? []
            
            switch changes {
                
            case .initial:
                
                self?.mView?.showMovieList()
                
                break
            case .update(_, let deletions, let insertions, let modification):
                
                self?.mView?.showMovieList()
                
                break
            case .error(let err):
                print(err.localizedDescription)
                
                break
            }
        }
        initGenreListFetchRequest()
        initMovieDataFetchRequest()
    }
    
    func attachView(view: HomeView) {
        mView = view
    }
    
    fileprivate func initGenreListFetchRequest() {
        let genres = realm.objects(MovieGenreVO.self)
        if genres.isEmpty {
            fetchGenreList()
        }
        
    }
    
    fileprivate func initMovieDataFetchRequest() {
        
        movieList = realm.objects(MovieVO.self)
        
        if movieList?.count == 0 {
            fetchNowPlayingMovies()
            fetchUpComingMovies()
            fetchPopularMovies()
            fetchTopRatedMovies()
        }
    }
    
    fileprivate func fetchGenreList() {
        
        MovieModelImpl.shared.fetchMovieGenresFromApi(success: { (genres) in
            genres.forEach { [weak self] genre in
                DispatchQueue.main.async {
                    MovieGenreResponse.saveMovieGenre(data: genre, realm: self!.realm)
                }
            }
        }) { (error) in
            print(error)
        }
        
    }
    
    /// Now Playing
    fileprivate func fetchNowPlayingMovies() {
        MovieModelImpl.shared.fetchNowPlayingMoviesFromApi(pageId: 1, success: { (movies) in
            DispatchQueue.main.async { [weak self] in
                
                movies.forEach{ movie in
                    MovieInfoResponse.saveMovie(data: movie, realm: self!.realm, movieType: "nowplaying")
                }
                
            }
            
        }) { (error) in
            print(error)
        }
        
    }
    
    
    /// Up Coming
    fileprivate func fetchUpComingMovies() {
        
        MovieModelImpl.shared.fetchUpComingMoviesFromApi(pageId: 1, success: { (movies) in
            DispatchQueue.main.async { [weak self] in
                
                movies.forEach{ movie in
                    MovieInfoResponse.saveMovie(data: movie, realm: self!.realm, movieType: "upcoming")
                }
                
            }
            
        }) { (error) in
            print(error)
        }
        
    }
    
    
    /// Top Rated
    fileprivate func fetchTopRatedMovies() {
        
        MovieModelImpl.shared.fetchTopRatedMoviesFromApi(pageId: 1, success: { (movies) in
            DispatchQueue.main.async { [weak self] in
                
                movies.forEach{ movie in
                    MovieInfoResponse.saveMovie(data: movie, realm: self!.realm, movieType: "toprated")
                }
                
            }
            
        }) { (error) in
            print(error)
        }
    }
    
    /// Trending
    fileprivate func fetchPopularMovies() {
        
        MovieModelImpl.shared.fetchPopularMoviesFromApi(pageId: 1, success: { (movies) in
            
            DispatchQueue.main.async { [weak self] in
                
                movies.forEach{ movie in
                    MovieInfoResponse.saveMovie(data: movie, realm: self!.realm, movieType: "trending")
                }
                
            }
            
        }) { (error) in
            print(error)
        }
    }


    
}
