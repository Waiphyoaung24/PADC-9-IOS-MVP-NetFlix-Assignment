//
//  HomeViewController.swift
//  NetFlix-MVP-Assignment
//
//  Created by Waiphyoag on 10/17/19.
//  Copyright © 2019 Waiphyoag. All rights reserved.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController {

    @IBOutlet weak var outerMovieTableView: UITableView!

    
    private let mPresenter : HomePresenterImpl = HomePresenterImpl()
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        outerMovieTableView.layer.backgroundColor = UIColor.black.cgColor
        outerMovieTableView.delegate = self
        outerMovieTableView.dataSource = self
        outerMovieTableView.separatorStyle = .none
        
        outerMovieTableView.registerForCell(strID: String(describing: DummySectionTableViewCell.self))
        outerMovieTableView.registerForCell(strID: String(describing: OuterMovieTableViewCell.self))
        

        self.mPresenter.onUIReady()
        self.mPresenter.attachView(view: self)
    }
    


}
extension HomeViewController : UITableViewDelegate{
    
}
extension HomeViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if #available(iOS 13.0, *) {
            // use the feature only available in iOS 9
            // for ex. UIStackView
            return 1
        } else {
            return 1
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let width = tableView.bounds.width * 1/3.5;
        
        switch indexPath.row {
        case 1:
          
                return width + (width/2)
            
            
            
        case 3:
        
                return width + (width/2)
        
            
            
        case 5:
            
                return width + (width/2)
            
            
        case 7:
          
                return width + (width/2)
            
            
        default:
            return UITableView.automaticDimension
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row%2 == 0) {
            let cell = outerMovieTableView.dequeueReusableCell(withIdentifier: String(describing: DummySectionTableViewCell.self), for: indexPath) as! DummySectionTableViewCell
            
            switch indexPath.row {
            case 0: cell.mData = "Trending"
                break
            case 2: cell.mData = "Now Showing"
                break
            case 4: cell.mData = "Up Coming"
                break
            case 6: cell.mData = "Top Rated"
                break
            default:
                break
            }
            return cell
            
        } else{
            let cell = outerMovieTableView.dequeueReusableCell(withIdentifier: String(describing: OuterMovieTableViewCell.self), for: indexPath) as! OuterMovieTableViewCell
            
            switch indexPath.row {
            case 1:
                cell.mData = mPresenter.trendingMovieList
                break
            case 3:
                cell.mData = mPresenter.nowShowingMovieList
                break
            case 5:
                cell.mData = mPresenter.upComingMovieList
                break
            case 7:
                cell.mData = mPresenter.topRatedMovieList
                break
            default:
                break
            }
            cell.delegate = self
            
            return cell;
        }
    }

}
extension HomeViewController : MovieDetailDelegate {
    func showMovieDetail(movieId: Int) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: String(describing: MovieDetailViewController.self)) as? MovieDetailViewController
        vc!.movieId = movieId 
        if let viewController = vc {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        
        
        
    }
    
    
}

extension HomeViewController : HomeView {
    func showMovieList() {
        self.outerMovieTableView.reloadData()
    }
    
    func showNoInternetError() {
        Dialog.showAlert(viewController: self, title: "Error", message: "No Internet Connection!")

    }
    
    
}
