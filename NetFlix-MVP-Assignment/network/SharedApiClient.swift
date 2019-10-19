//
//  SharedApiClient.swift
//  NetFlix-MVP-Assignment
//
//  Created by Waiphyoag on 10/17/19.
//  Copyright © 2019 Waiphyoag. All rights reserved.
//

import Foundation
class SharedApiClient: BaseApiClient {
    
    // MARK: - Pproperties
    static let shared = SharedApiClient()
    
    // Initialization
    private override init() {
        
    }
}
extension SharedApiClient : IApiClient {
    func fetchTrailerByMovieId(movieId: Int, success: @escaping ([MovieTrailerInfoResponse]) -> Void, fail: @escaping (String) -> Void) {
        self.requestApiWithoutHeaders(url: Routes.getTrailer(movieId: movieId), method: .get, params: [:], success: { (response) in
            
            let apiResponse = try! JSONDecoder().decode(MovieTrailerListResponse.self, from: response)
            
            success(apiResponse.results)
            
        }) { (error) in
            fail(error)
        }
    }
    
    func fetchMovieDetailById(movieId: Int, success: @escaping (MovieDetailResponse) -> Void, fail: @escaping (String) -> Void) {
        
        self.requestApiWithoutHeaders(url: Routes.getDetail(movieId: movieId), method: .get, params: [:], success: { (response) in
            
            let apiResponse = try! JSONDecoder().decode(MovieDetailResponse.self, from: response)
            
            success(apiResponse)
            
        }) { (error) in
            fail(error)
        }
    }
    
    func fetchMoviesByName(movieName: String, success: @escaping ([MovieInfoResponse]) -> Void, fail: @escaping (String) -> Void) {
        
        self.requestApiWithoutHeaders(url: "\(Routes.ROUTE_SEACRH_MOVIES)?api_key=\(API.KEY)&query=\(movieName.replacingOccurrences(of: " ", with: "%20") )" , method: .get
            , params: [:], success: { (response) in
                
                let apiResponse = try! JSONDecoder().decode(MovieListResponse.self, from: response)
                
                success(apiResponse.results)
        }) { (error) in
            
            fail(error)
        }

    }
    
    func fetchMovieDetails(movieId: Int, success: @escaping (MovieInfoResponse) -> Void, fail: @escaping (String) -> Void) {
        self.requestApiWithoutHeaders(url: "\(Routes.ROUTE_MOVIE_DETAILS)/\(movieId)?api_key=\(API.KEY)", method: .get, params: [:], success: { (response) in
            
            let apiResponse = try! JSONDecoder().decode(MovieInfoResponse.self, from: response)
            
            success(apiResponse)
        }) { (error) in
            fail(error)
        }
    }
    
    func fetchTopRatedMovies(pageId: Int, success: @escaping ([MovieInfoResponse]) -> Void, fail: @escaping (String) -> Void) {
        
        self.requestApiWithoutHeaders(url: "\(Routes.ROUTE_TOP_RATED_MOVIES)&page=\(pageId)", method: .get, params: [:], success: { (response) in
            
            let apiResponse = try! JSONDecoder().decode(MovieListResponse.self, from: response)
            
            success(apiResponse.results)
            
        }) { (error) in
            fail(error)
        }
    }
    
    func fetchSimilarMovies(movieId: Int, success: @escaping ([MovieInfoResponse]) -> Void, fail: @escaping (String) -> Void) {
        
        self.requestApiWithoutHeaders(url: Routes.getSimilarMovies(movieId: movieId), method: .get, params: [:], success: { (response) in
            
            let apiResponse = try! JSONDecoder().decode(MovieListResponse.self, from: response)
            
            success(apiResponse.results)
        }) { (error) in
            fail(error)
        }
    }
    
    func fetchNowPlayingMovies(pageId: Int, success: @escaping ([MovieInfoResponse]) -> Void, fail: @escaping (String) -> Void) {
        
        self.requestApiWithoutHeaders(url: "\(Routes.ROUTE_NOW_PLAYING_MOVIES)&page=\(pageId)", method: .get, params: [:], success: { (response) in
            
            let apiResponse = try! JSONDecoder().decode(MovieListResponse.self, from: response)
            
            success(apiResponse.results)
            
        }) { (error) in
            fail(error)
        }
    }
    
    func fetchUpComingMovies(pageId: Int, success: @escaping ([MovieInfoResponse]) -> Void, fail: @escaping (String) -> Void) {
        self.requestApiWithoutHeaders(url: "\(Routes.ROUTE_UP_COMNG_MOVIES)&page=\(pageId)", method: .get, params: [:], success: { (response) in
            
            let apiResponse = try! JSONDecoder().decode(MovieListResponse.self, from: response)
            
            success(apiResponse.results)
            
        }) { (error) in
            fail(error)
        }
    }
    
    func fetchPopularMovies(pageId: Int, success: @escaping ([MovieInfoResponse]) -> Void, fail: @escaping (String) -> Void) {
        
        self.requestApiWithoutHeaders(url: "\(Routes.ROUTE_POPULAR_MOVIES)&page=\(pageId)", method: .get, params: [:], success: { (response) in
            
            let apiResponse = try! JSONDecoder().decode(MovieListResponse.self, from: response)
            
            success(apiResponse.results)
            
        }) { (error) in
            fail(error)
        }
    }
    
    func fetchMovieGenres(success: @escaping ([MovieGenreResponse]) -> Void, fail: @escaping (String) -> Void) {
        self.requestApiWithoutHeaders(url: Routes.ROUTE_MOVIE_GENRES, method: .get, params: [:], success: { (response) in
            
            let apiResponse = try! JSONDecoder().decode(MovieGenreListResponse.self, from: response)
            
            success(apiResponse.genres)
        }) { (error) in
            fail(error)
        
    }
    
    func fetchTrailerByMovieId(movieId: Int, success: @escaping ([MovieTrailerInfoResponse]) -> Void, fail: @escaping (String) -> Void) {
        
        self.requestApiWithoutHeaders(url: Routes.getTrailer(movieId: movieId), method: .get, params: [:], success: { (response) in
            
            let apiResponse = try! JSONDecoder().decode(MovieTrailerListResponse.self, from: response)
            
            success(apiResponse.results)
            
        }) { (error) in
            fail(error)
        }
    }
    
    func fetchMovieDetailById(movieId: Int, success: @escaping (MovieDetailResponse) -> Void, fail: @escaping (String) -> Void) {
        
        self.requestApiWithoutHeaders(url: Routes.getDetail(movieId: movieId), method: .get, params: [:], success: { (response) in
            
            let apiResponse = try! JSONDecoder().decode(MovieDetailResponse.self, from: response)
            
            success(apiResponse)
            
        }) { (error) in
            fail(error)
        }
    }
    
    }
}
