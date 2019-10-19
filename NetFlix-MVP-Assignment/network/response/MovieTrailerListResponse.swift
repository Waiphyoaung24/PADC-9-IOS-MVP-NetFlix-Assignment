//
//  File.swift
//  NetFlix-MVP-Assignment
//
//  Created by Waiphyoag on 10/17/19.
//  Copyright © 2019 Waiphyoag. All rights reserved.
//

import Foundation
import RealmSwift

struct MovieTrailerListResponse : Codable {
    let id : Int
    let results : [MovieTrailerInfoResponse]
}
