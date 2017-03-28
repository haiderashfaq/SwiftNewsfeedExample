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
    var dateTimePublished: String?
    var imageUrl: String?
    
    init(id: Int, title: String, body: String, dateTimePublished: String, imageUrl: String) {
        self.id = id
        self.title = title
        self.body = body
        self.dateTimePublished = dateTimePublished
        self.imageUrl = imageUrl
    }
    
    required init?(json: JSON) {
        
        if ((json["id"] != nil)) {
            self.id = ("id" <~~ json)!
        }
        
        if ((json["title"] != nil)) {
            self.title = ("title" <~~ json)!
        }
        
        //because some of the bodys are null
        guard let body = json["body"] as? String else {
            self.body = "Sorry there is no body content at this time"
            return
        }
        self.body = body
        
        if ((json["date_published"] != nil)) {
            self.dateTimePublished = ("date_published" <~~ json)!
        }
        
        guard let imageUrl = json["image"] as? String else {
            print("I AM HERE")
            self.imageUrl = "icon_placeholder_image"
            print("I AM HERE TO: URL PLACEHOLDER: \(self.imageUrl)")
            return
        }
        self.imageUrl = imageUrl
        
        print("ID: \(self.id)")
        print("TITLE: \(self.title)")
        print("BODY: \(self.body)")
        print("DATE TIME PUBLISHED: \(self.dateTimePublished)")
        print("IMAGE URL: \(self.imageUrl)")
        
        let cacheData = CacheData()
        cacheData.addArticle(id: self.id!, title: self.title!, body: self.body!, dateTimePublished: self.dateTimePublished!, imageUrl: self.imageUrl!)
        print("REALM OBJECTS: \(cacheData.getNumObjects())")
    }
    
    
    
    //Decided against this in the end as I used a webview to display the body content. Good function to know though.
    //Strip Html from body string recieved from API
    func formatBody(body: String) -> String {
        let text = body
        let formattedBody = text.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        print(formattedBody)
        return formattedBody
    }
    
}
