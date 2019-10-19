//
//  CustomHeaderTableViewCell.swift
//  NetFlix-MVP-Assignment
//
//  Created by Waiphyoag on 10/18/19.
//  Copyright © 2019 Waiphyoag. All rights reserved.
//

import UIKit

class CustomHeaderTableViewCell: UITableViewCell {
 @IBOutlet weak var lblHeader: UILabel!
    
    var headerTitle: String? {
        didSet {
            lblHeader.text = headerTitle
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
