//
//  HomePresenter.swift
//  NetFlix-MVP-Assignment
//
//  Created by Waiphyoag on 10/17/19.
//  Copyright © 2019 Waiphyoag. All rights reserved.
//

import Foundation
protocol HomePresenter {
    
    func onUIReady()
    func attachView(view: HomeView)
}
