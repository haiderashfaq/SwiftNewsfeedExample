//
//  NewsFeedViewController.swift
//  SwiftNewsFeedExample
//
//  Created by Haider Ashfaq on 25/03/2017.
//  Copyright © 2017 Haider Ashfaq. All rights reserved.
//

import UIKit
import RealmSwift

class NewsFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Private
    private var newsModel: NewsModel!
    let cacheData = CacheData()
    private var articleTitleArray: [String] = []
    private var articleDatesTimesPublishedArray: [String] = []
    private var articleBodys: [String] = []
    private var articleImageUrls: [String] = []
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //just to find default.lock realm file location on simulator - not relared to app
        print("REALM", Realm.Configuration.defaultConfiguration.fileURL!)
        
        //load cell data from local Realm
        articleTitleArray = cacheData.getArticleTitles()
        articleDatesTimesPublishedArray = cacheData.getArticleDateTimePublished()
        articleImageUrls = cacheData.getImageUrl()
        articleBodys = cacheData.getBodyContent()
        
        // This view controller itself will provide the delegate methods and row data for the table view.
        tableView.delegate = self
        tableView.dataSource = self
        
        //set tableView row height same as set in storyboard
        tableView.rowHeight = 300
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cacheData.getNumObjects()
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomNewsFeedItemTableViewCell
        let row = indexPath.row
        
        //format custom cell labels
        cell.titleLabel.lineBreakMode = .byWordWrapping
        cell.titleLabel.numberOfLines = 0;
        cell.titleLabel.text = articleTitleArray[row]
        cell.dateTimeLabel.text = "Date Published: \(articleDatesTimesPublishedArray[row])"
        
        //set imageView with image Url
        let url = NSURL(string: articleImageUrls[row])
        let data = NSData(contentsOf:url! as URL)
        
        // It is the best way to manage nil issue as some image url's have randomly stopped working
        if (data) != nil {
            cell.newsImage?.image = UIImage(data:data! as Data)
        } else {
            // In this when data is nil or empty then we can assign a placeholder image
            cell.newsImage?.image = UIImage(named: "icon_placeholder_image")
        }
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You clicked cell number \(indexPath.row).")
        let row = indexPath.row
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let chosenArticleViewController = mainStoryboard.instantiateViewController(withIdentifier: "chosenVc") as! ChosenArticleViewController
        chosenArticleViewController.titleString = articleTitleArray[row]
        chosenArticleViewController.dateTimePublished = articleDatesTimesPublishedArray[row]
        chosenArticleViewController.imageUrl = articleImageUrls[row]
        chosenArticleViewController.body = articleBodys[row]
        self.present(chosenArticleViewController, animated: true, completion: nil)
    }
}
