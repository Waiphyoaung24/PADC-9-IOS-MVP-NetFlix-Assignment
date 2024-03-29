//
//  MovieGenreResponse.swift
//  NetFlix-MVP-Assignment
//
//  Created by Waiphyoag on 10/17/19.
//  Copyright © 2019 Waiphyoag. All rights reserved.
//

import Foundation
import RealmSwift

struct MovieGenreResponse : Codable {
    let id : Int
    let name : String
    
    static func saveMovieGenre(data : MovieGenreResponse, realm: Realm) {
        
        //TODO: Implement Save Realm object MovieGenreVO
        
        let movieGenreVO = MovieGenreVO()
        movieGenreVO.id = data.id
        movieGenreVO.name = data.name
        
        let genre = realm.object(ofType: MovieGenreVO.self, forPrimaryKey: data.id)
        
        if let mGenre = genre {
            
            try! realm.write {
                mGenre.name = data.name
            }
        } else{
            do {
                try realm.write {
                    realm.add(movieGenreVO)
                }
            }catch {
                
            }
        }
    }
}
