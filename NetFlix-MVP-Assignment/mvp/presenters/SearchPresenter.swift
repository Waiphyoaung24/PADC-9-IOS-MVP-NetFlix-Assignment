//
//  SearchPresenter.swift
//  NetFlix-MVP-Assignment
//
//  Created by Waiphyoag on 10/17/19.
//  Copyright © 2019 Waiphyoag. All rights reserved.
//

import Foundation
protocol SearchPresenter {
    func onUIReady()
    func searchMovie(movieName: String)
    func attachView(view: SearchView)
}
