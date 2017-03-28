//
//  CustomNewsFeedItemTableViewCell.swift
//  SwiftNewsFeedExample
//
//  Created by Haider Ashfaq on 27/03/2017.
//  Copyright © 2017 Haider Ashfaq. All rights reserved.
//

import UIKit

class CustomNewsFeedItemTableViewCell: UITableViewCell {
    
    //MARK :- Outlets

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
