//
//  ApiWrapper.swift
//  SwiftNewsFeedExample
//
//  Created by Haider Ashfaq on 25/03/2017.
//  Copyright © 2017 Haider Ashfaq. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage
import OAuthSwift
import Gloss

protocol ApiWrapper {
    
    // MARK: News
    func getAllNewsContent(completion: @escaping (Bool) -> ())
}

class LiveAPI: ApiWrapper {
    
    //@TO-DO better error handling of API response
    func getAllNewsContent(completion: @escaping (Bool) -> ()) {
        Alamofire.request(Constants.APIBaseUrl, method: .get).responseJSON { response in
            print(response.request!)  // original URL request
            print(response.result)   // result of response serialization
            
            if response.result.isSuccess  {
                guard let json = response.result.value as? JSON else {
                    return
                }
                
                print("JSON: \(json)")
                guard let news: [NewsModel] = "articles" <~~ json else {
                    return //could add completion block here at a later point
                }
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
