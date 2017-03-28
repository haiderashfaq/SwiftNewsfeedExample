//
//  ChosenArticleViewController.swift
//  SwiftNewsFeedExample
//
//  Created by Haider Ashfaq on 27/03/2017.
//  Copyright © 2017 Haider Ashfaq. All rights reserved.
//

import UIKit

class ChosenArticleViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var bodyWebView: UIWebView!
    
    
    //MARK:- Private
    var titleString: String = ""
    var dateTimePublished: String = ""
    var imageUrl: String = ""
    var body: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0;
        titleLabel.text = titleString
        
        //set imageView with image Url
        let url = NSURL(string: imageUrl)
        let data = NSData(contentsOf:url! as URL)
        
        // It is the best way to manage nil issue.
        if (data?.length)! > 0 {
            articleImage.image = UIImage(data:data! as Data)
        } else {
            // In this when data is nil or empty then we can assign a placeholder image
            articleImage.image = UIImage(named: "icon_placeholder_image")
        }
        
        dateTimeLabel.text = dateTimePublished
        bodyWebView.loadHTMLString(body, baseURL: nil)
        print("CHOSEN IMAGE: \(imageUrl)")
        print("CHOSEN BODY: \(body)")
        
    }
}
