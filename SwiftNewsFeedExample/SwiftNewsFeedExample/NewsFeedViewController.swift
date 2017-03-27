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
    private let apiWrapper: ApiWrapper = LiveAPI()
    private var bridge: getNewsContentBridge!
    private var newsModel: NewsModel!
    let cacheData = CacheData()
    private var articleTitleArray: [String] = []

    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //initialize the collection view
        
        print("REALM", Realm.Configuration.defaultConfiguration.fileURL!)
      
        self.bridge = getNewsContentBridge.init(apiWrapper: self.apiWrapper)
        bridge.getAllNewsContent()
        
        articleTitleArray = cacheData.getArticleTitles()
        
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
        //cell.titleLabel.adjustsFontSizeToFitWidth = true
        cell.titleLabel.lineBreakMode = .byWordWrapping
        cell.titleLabel.numberOfLines = 0;
        cell.titleLabel.text = articleTitleArray[row]
        cell.newsImage?.image = UIImage(named: "icon_test")
        
        
        // set the text from the data model
        //cell.textLabel?.text = articleTitleArray[indexPath.row]
        

        
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
    
    
    

    
    

}
