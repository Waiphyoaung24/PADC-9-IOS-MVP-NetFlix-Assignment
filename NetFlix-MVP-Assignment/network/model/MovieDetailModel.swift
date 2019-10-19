//
//  MovieDetailModel.swift
//  NetFlix-MVP-Assignment
//
//  Created by Waiphyoag on 10/17/19.
//  Copyright © 2019 Waiphyoag. All rights reserved.
//

import Foundation
import RealmSwift

protocol MovieDetailModel {
    
    func fetchMovieDetailByIdFromApi (movieId : Int,
                                      success : @escaping (MovieDetailResponse) -> Void,
                                      fail: @escaping (String) -> Void
)
}
