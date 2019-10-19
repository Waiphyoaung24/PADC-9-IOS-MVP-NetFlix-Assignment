//
//  MovieListResponse.swift
//  NetFlix-MVP-Assignment
//
//  Created by Waiphyoag on 10/17/19.
//  Copyright © 2019 Waiphyoag. All rights reserved.
//

import Foundation
import RealmSwift
struct MovieListResponse : Codable {
    //    let page : Int
    let total_results : Int
    let total_pages : Int
    let results : [MovieInfoResponse]
}
