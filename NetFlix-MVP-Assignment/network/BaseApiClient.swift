//
//  BaseApiClient.swift
//  NetFlix-MVP-Assignment
//
//  Created by Waiphyoag on 10/17/19.
//  Copyright © 2019 Waiphyoag. All rights reserved.
//

import Foundation
import Alamofire

let USER_TOKEN = "ACCESS_TOKEN"
open class BaseApiClient {
    
    fileprivate let BASE_URL = "https://2edd5285-2da8-4bcd-997c-0eb2c4e77da4.mock.pstmn.io/"
    
    /*
     Function for api with headers
     */
    func requestApiWithHeaders(
        url:String,
        method:HTTPMethod,
        params:Parameters,
        success: @escaping(Data) -> Void,
        fail: @escaping(String) -> Void
        ) {
        
        let headers:HTTPHeaders = [
            // Key: Value
            "Authorization" : "Bearer \(UserDefaults.standard.string(forKey: USER_TOKEN) ?? "")"
        ]
        
        Alamofire.request(url, method: method, parameters: params, headers: headers)
            .responseJSON{ response in
                
                switch response.result {
                case .success:
                    success(response.data!)
                    
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                    fail(error.localizedDescription)
                }
        }
}

    func requestApiWithoutHeaders(
        url:String,
        method:HTTPMethod,
        params:Parameters,
        success: @escaping(Data) -> Void,
        fail: @escaping(String) -> Void
        ) {
        
        Alamofire.request(url, method: method, parameters: params, headers: [:])
            .responseJSON{ response in
                
                switch response.result {
                case .success:
                    success(response.data!)
                    
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                    fail(error.localizedDescription)
                }
        }
    }
    
    func generateUrl(route:String) -> String {
        
        return BASE_URL + route
    }
}

