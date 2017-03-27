//
//  NewsModel.swift
//  SwiftNewsFeedExample
//
//  Created by Haider Ashfaq on 26/03/2017.
//  Copyright © 2017 Haider Ashfaq. All rights reserved.
//

import Foundation
import Gloss

final class NewsModel: Decodable {
    
    var id: Int?
    var title: String?
    var body: String?
    var feedId: Int?
    
    init(id: Int, title: String, body: String, feedId: Int) {
        self.id = id
        self.title = title
        self.body = body
        self.feedId = feedId
        
    }
    
    required init?(json: JSON) {
        
        if ((json["id"] != nil)) {
            self.id = ("id" <~~ json)!
        }
        
        if ((json["title"] != nil)) {
            self.title = ("title" <~~ json)!
        }
        
        
        guard let body = json["body"] as? String else {
           return
        }
        self.body = body
        
        if ((json["feed_id"] != nil)) {
            self.feedId = ("feed_id" <~~ json)!
        }
        
        print("ID: \(self.id)")
        print("TITLE: \(self.title)")
        print("BODY: \(self.body)")
        print("FEED ID: \(self.feedId)")
        
        
        //remove html from body string to ensure in correct format for local storage (Realm) and display purposes and then pass into addArticle function as attribute
    
        
        let cacheData = CacheData()
        cacheData.addArticle(id: self.id!, title: self.title!, body: self.formatBody(body: self.body!), feedId: self.feedId!)
        print("REALM OBJECTS: \(cacheData.getNumObjects())")
    }
    
    //Strip Html from body string recieved from API
    func formatBody(body: String) -> String {
        let text = body
        let formattedBody = text.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        print(formattedBody)
        return formattedBody
    }
    
}
