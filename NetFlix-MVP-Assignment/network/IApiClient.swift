//
//  IApiClient.swift
//  NetFlix-MVP-Assignment
//
//  Created by Waiphyoag on 10/17/19.
//  Copyright © 2019 Waiphyoag. All rights reserved.
//

import Foundation
protocol IApiClient {
    
   
    func fetchMoviesByName(movieName : String,
                           success : @escaping ([MovieInfoResponse]) -> Void,
                           fail : @escaping (String) -> Void
    )
    
    func fetchMovieDetails(movieId : Int,
                           success: @escaping (MovieInfoResponse) -> Void,
                           fail : @escaping (String) -> Void
    )
    
    func fetchTopRatedMovies(pageId : Int,
                             success : @escaping ([MovieInfoResponse]) -> Void,
                             fail : @escaping (String) -> Void
    )
    
    func fetchSimilarMovies(movieId : Int,
                            success : @escaping ([MovieInfoResponse]) -> Void,
                            fail : @escaping (String) -> Void
    )
    
    func fetchNowPlayingMovies(pageId : Int,
                               success : @escaping ([MovieInfoResponse]) -> Void,
                               fail : @escaping (String) -> Void
    )
    
    func fetchUpComingMovies(pageId : Int,
                             success : @escaping ([MovieInfoResponse]) -> Void,
                             fail : @escaping (String) -> Void
    )
    
    func fetchPopularMovies(pageId : Int,
                            success : @escaping ([MovieInfoResponse]) -> Void,
                            fail : @escaping (String) -> Void
    )
    
    func fetchMovieGenres(success : @escaping ([MovieGenreResponse]) -> Void ,
                          fail : @escaping (String) -> Void
    )
    
    func fetchTrailerByMovieId(movieId : Int,
                               success : @escaping ([MovieTrailerInfoResponse]) -> Void,
                               fail: @escaping(String) -> Void
    )
    
    func fetchMovieDetailById(movieId: Int,
                              success: @escaping (MovieDetailResponse) -> Void,
                              fail: @escaping (String) -> Void
    )
    

}
