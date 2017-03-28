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
    dynamic var dateTimePublished: String = ""
    dynamic var imageUrl: String = ""
    
    
    convenience init(id: Int, title: String, body: String, dateTimePublished: String, imageUrl: String) {
        self.init()
        self.id = id
        self.title = title
        self.body = body
        self.dateTimePublished = dateTimePublished
        self.imageUrl = imageUrl
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    func getArticleTitle() -> String {
        return self.title
    }
    
    func getArticleDateTimePublished() -> String {
        return self.dateTimePublished
    }
    
    func getBodyContent() -> String {
        return self.body
    }
    
    func getImageUrl() -> String {
        return self.imageUrl
    }
    
}

class CacheData {
    func addArticle(id: Int, title: String, body: String, dateTimePublished: String, imageUrl: String) -> Bool {
        
        do {
            let realm = try Realm()
            let article = Article.init(id: id, title: title, body: body, dateTimePublished: dateTimePublished, imageUrl: imageUrl)
            
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
    
    func getArticleDateTimePublished() -> [String] {
        
        do {
            let realm = try Realm()
            
            let results = realm.objects(Article)
            return results.map { $0.getArticleDateTimePublished() }
        } catch let error {
            print("Realm read error: \(error)")
            return []
        }
    }
    
    func getBodyContent() -> [String] {
        
        do {
            let realm = try Realm()
            
            let results = realm.objects(Article)
            return results.map { $0.getBodyContent() }
        } catch let error {
            print("Realm read error: \(error)")
            return []
        }
    }
    
    func getImageUrl() -> [String] {
        
        do {
            let realm = try Realm()
            
            let results = realm.objects(Article)
            return results.map { $0.getImageUrl() }
        } catch let error {
            print("Realm read error: \(error)")
            return []
        }
    }
    
}
