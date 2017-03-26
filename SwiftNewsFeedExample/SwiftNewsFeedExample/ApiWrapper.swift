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

//typealias NewsContentResponseCallback = ((results: [SearchDeviceResult]) -> Void)


protocol ApiWrapper {

    // MARK: News
   func getAllNewsContent()
    
    
}

class LiveAPI: ApiWrapper {
    
    
    func getAllNewsContent() {
        Alamofire.request(Constants.APIBaseUrl).responseJSON { response in
            print(response.request!)  // original URL request
            print(response.response!) // HTTP URL response
            print(response.data!)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
    }
    
}
