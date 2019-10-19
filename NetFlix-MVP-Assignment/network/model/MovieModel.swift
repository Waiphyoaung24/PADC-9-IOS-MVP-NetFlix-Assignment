//
//  RemoteModel.swift
//  NetFlix-MVP-Assignment
//
//  Created by Waiphyoag on 10/17/19.
//  Copyright © 2019 Waiphyoag. All rights reserved.
//

import Foundation
protocol MovieModel {
    
   
   
   
    
    
    func fetchMoviesByNameFromApi(movieName : String,
                                  success : @escaping ([MovieInfoResponse]) -> Void,
                                  fail : @escaping (String) -> Void
    )
    
    func fetchMovieDetailsFromApi(movieId : Int,
                                  success: @escaping (MovieInfoResponse) -> Void,
                                  fail : @escaping (String) -> Void
    )
    
    func fetchTopRatedMoviesFromApi(pageId : Int,
                                    success : @escaping ([MovieInfoResponse]) -> Void,
                                    fail : @escaping (String) -> Void
    )
    
    func fetchSimilarMoviesFromApi(movieId : Int,
                                   success : @escaping ([MovieInfoResponse]) -> Void,
                                   fail : @escaping (String) -> Void
    )
    
    func fetchNowPlayingMoviesFromApi(pageId : Int,
                                      success : @escaping ([MovieInfoResponse]) -> Void,
                                      fail : @escaping (String) -> Void
    )
    
    func fetchUpComingMoviesFromApi(pageId : Int,
                                    success : @escaping ([MovieInfoResponse]) -> Void,
                                    fail : @escaping (String) -> Void
    )
    
    func fetchPopularMoviesFromApi(pageId : Int,
                                   success : @escaping ([MovieInfoResponse]) -> Void,
                                   fail : @escaping (String) -> Void
    )
    
    func fetchMovieGenresFromApi(success : @escaping ([MovieGenreResponse]) -> Void ,
                                 fail : @escaping (String) -> Void
)

}
