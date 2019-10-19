//
//  RemoteModelImpl.swift
//  NetFlix-MVP-Assignment
//
//  Created by Waiphyoag on 10/17/19.
//  Copyright © 2019 Waiphyoag. All rights reserved.
//

import Foundation
class MovieModelImpl : BaseModel {
    
    static var shared = MovieModelImpl()
    private override init() {}
    
}
extension MovieModelImpl : MovieModel {
    
    
    
    
    func fetchMoviesByNameFromApi(movieName: String, success: @escaping ([MovieInfoResponse]) -> Void, fail: @escaping (String) -> Void) {
        
        SharedApiClient.shared.fetchMoviesByName(movieName: movieName, success: { (response) in
            success(response)
        }) { (error) in
            fail(error)
        }
    }
    
    func fetchMovieDetailsFromApi(movieId: Int, success: @escaping (MovieInfoResponse) -> Void, fail: @escaping (String) -> Void) {
        
        SharedApiClient.shared.fetchMovieDetails(movieId: movieId, success: { (response) in
            success(response)
        }) { (error) in
            fail(error)
        }
    }
    
    func fetchTopRatedMoviesFromApi(pageId: Int, success: @escaping ([MovieInfoResponse]) -> Void, fail: @escaping (String) -> Void) {
        
        SharedApiClient.shared.fetchTopRatedMovies(pageId: pageId, success: { (response) in
            
            success(response)
            
        }) { (error) in
            fail(error)
        }
    }
    
    func fetchSimilarMoviesFromApi(movieId: Int, success: @escaping ([MovieInfoResponse]) -> Void, fail: @escaping (String) -> Void) {
        
        SharedApiClient.shared.fetchSimilarMovies(movieId: movieId, success: { (response) in
            success(response)
        }) { (error) in
            fail(error)
        }
    }
    
    func fetchNowPlayingMoviesFromApi(pageId: Int, success: @escaping ([MovieInfoResponse]) -> Void, fail: @escaping (String) -> Void) {
        
        SharedApiClient.shared.fetchNowPlayingMovies(pageId: pageId, success: { (response) in
            success(response)
        }) { (error) in
            fail(error)
        }
    }
    
    func fetchUpComingMoviesFromApi(pageId: Int, success: @escaping ([MovieInfoResponse]) -> Void, fail: @escaping (String) -> Void) {
        
        SharedApiClient.shared.fetchUpComingMovies(pageId: pageId, success: { (response) in
            success(response)
        }) { (error) in
            fail(error)
        }
    }
    
    func fetchPopularMoviesFromApi(pageId: Int, success: @escaping ([MovieInfoResponse]) -> Void, fail: @escaping (String) -> Void) {
        
        SharedApiClient.shared.fetchPopularMovies(pageId: pageId, success: { (response) in
            success(response)
        }) { (error) in
            fail(error)
        }
    }
    
    func fetchMovieGenresFromApi(success: @escaping ([MovieGenreResponse]) -> Void, fail: @escaping (String) -> Void) {
        
        SharedApiClient.shared.fetchMovieGenres(success: { (response) in
            success(response)
        }) { (error) in
            fail(error)
        }
    }
    
}
