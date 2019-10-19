//
//  DummySectionTableViewCell.swift
//  NetFlix-MVP-Assignment
//
//  Created by Waiphyoag on 10/17/19.
//  Copyright © 2019 Waiphyoag. All rights reserved.
//

import UIKit

class DummySectionTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    
    var mData : String! {
        didSet {
            lblTitle.text = mData
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
