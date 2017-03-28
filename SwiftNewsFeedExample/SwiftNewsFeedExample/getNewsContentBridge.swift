//
//  getNewsContentBridge.swift
//  SwiftNewsFeedExample
//
//  Created by Haider Ashfaq on 26/03/2017.
//  Copyright © 2017 Haider Ashfaq. All rights reserved.
//

import Foundation

class getNewsContentBridge {
    
    // MARK: - Private
    private let apiWrapper: ApiWrapper
    
    init(apiWrapper: ApiWrapper) {
        self.apiWrapper = apiWrapper
    }
    
    //@TO-DO better and more precise strategy with what to with the error handling here if completion is false
    func getAllNewsContent()   {
        self.apiWrapper.getAllNewsContent() { (completion) -> () in
            print("COMPLETION STATUS: \(completion)")
            if completion == true {
                print("COMPLETION IS TRUE")
            } else {
                
            }
        }
    }
}
