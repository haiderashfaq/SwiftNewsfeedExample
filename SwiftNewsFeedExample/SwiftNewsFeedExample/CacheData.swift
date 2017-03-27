//
//  CacheData.swift
//  SwiftNewsFeedExample
//
//  Created by Haider Ashfaq on 26/03/2017.
//  Copyright © 2017 Haider Ashfaq. All rights reserved.
//

import Foundation
import RealmSwift

class Article: Object {
    dynamic var id: Int = 0
    dynamic var title: String = ""
    dynamic var body: String = ""
    dynamic var feedId: Int = 0
    
    convenience init(id: Int, title: String, body: String, feedId: Int) {
        self.init()
        self.id = id
        self.title = title
        self.body = body
        self.feedId = feedId
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    func getArticleTitle() -> String {
        return self.title
    }
    
}

class CacheData {
    func addArticle(id: Int, title: String, body: String, feedId: Int) -> Bool {
        
        do {
            let realm = try Realm()
            let article = Article.init(id: id, title: title, body: body, feedId: feedId)
            
            try! realm.write {
                realm.add(article, update: true)
            }
            return true
        } catch let error {
            print("Realm write error: \(error)")
            return false
        }
    }
    
    func getNumObjects() -> Int {
        
        do {
            let realm = try Realm()
            return realm.objects(Article).count
        } catch let error {
            print("Realm read error: \(error)")
            return 0
        }
    }
    
    func getArticleTitles() -> [String] {
        
        do {
            let realm = try Realm()
            
            let results = realm.objects(Article)
            return results.map { $0.getArticleTitle() }
        } catch let error {
            print("Realm read error: \(error)")
            return []
        }

        
        
        
    }
    
}
