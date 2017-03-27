//
//  ViewController.swift
//  SwiftNewsFeedExample
//
//  Created by Haider Ashfaq on 25/03/2017.
//  Copyright © 2017 Haider Ashfaq. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import OAuthSwift

class ViewController: UIViewController {
    
    // MARK:- Private
 
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func testAPIGetAllNewsContent(_ sender: Any) {
        
        
        Alamofire.request(Constants.APIBaseUrl, method: .get).responseJSON { response in
            print(response.request!)  // original URL request
//            print(response.response!) // HTTP URL response
//            print(response.data!)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }

        
        
    }

}

