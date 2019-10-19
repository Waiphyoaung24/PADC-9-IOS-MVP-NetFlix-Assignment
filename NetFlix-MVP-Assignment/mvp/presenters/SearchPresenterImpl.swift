//
//  SearchPresenterImpl.swift
//  NetFlix-MVP-Assignment
//
//  Created by Waiphyoag on 10/17/19.
//  Copyright © 2019 Waiphyoag. All rights reserved.
//

import Foundation
import RealmSwift
class SearchPresenterImpl : BasePresenter {
    
    var mView: SearchView? = nil
    
    let realm  = try! Realm()
    
    var searchedResult = [MovieInfoResponse]()
    
}

extension SearchPresenterImpl : SearchPresenter {
    func onUIReady() {
        
    }
    
    func searchMovie(movieName: String) {
        
        if NetworkUtils.checkReachable() == false {
            
            mView?.showNoInternetError()
            return
        }
        
        MovieModelImpl.shared.fetchMoviesByNameFromApi(movieName: movieName, success: { (results) in
            
            self.searchedResult = results
            
            DispatchQueue.main.async {
                
                results.forEach({ [weak self] (movieInfo) in
                    MovieInfoResponse.saveMovie(data: movieInfo, realm: self!.realm, movieType: "searched")
                })
                
                if results.isEmpty {
                    self.mView?.showEmptyMovieList(movieName: movieName)
                    return
                }
                
                self.mView?.showMovieList()
                
            }
            
        }) { (error) in
            
        }
        
    }
    
    func attachView(view: SearchView) {
        self.mView = view
    }
    
    

}
