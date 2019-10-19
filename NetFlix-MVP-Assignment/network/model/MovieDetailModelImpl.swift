//
//  MovieDetailModelImpl.swift
//  NetFlix-MVP-Assignment
//
//  Created by Waiphyoag on 10/17/19.
//  Copyright © 2019 Waiphyoag. All rights reserved.
//

import Foundation
class MovieDetailModelImpl: BaseModel {
    
    static var shared = MovieDetailModelImpl()
    
    private override init() {
        
    }
}


extension MovieDetailModelImpl: MovieDetailModel {
    func fetchMovieDetailByIdFromApi(movieId: Int, success: @escaping (MovieDetailResponse) -> Void, fail: @escaping (String) -> Void) {
        SharedApiClient.shared.fetchMovieDetailById(movieId: movieId, success: { (response) in
            success(response)
        }) { (error) in
            fail(error)
        }
    }
}
