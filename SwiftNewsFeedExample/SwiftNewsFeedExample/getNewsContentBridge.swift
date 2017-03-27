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
    
    func getAllNewsContent() {
        self.apiWrapper.getAllNewsContent()
        
       // print("TEST: \()")
    }
    
    
}
