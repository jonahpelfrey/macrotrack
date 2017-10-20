//
//  LogViewCell.swift
//  tracker
//
//  Created by Jonah Pelfrey on 10/20/17.
//  Copyright © 2017 Jonah Pelfrey. All rights reserved.
//

import UIKit

class LogViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
