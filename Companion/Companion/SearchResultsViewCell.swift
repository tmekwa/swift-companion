//
//  SearchResultsViewCell.swift
//  Companion
//
//  Created by Thato MEKWA on 2018/10/15.
//  Copyright © 2018 Thato MEKWA. All rights reserved.
//

import UIKit

class SearchResultsViewCell: UITableViewCell {

    @IBOutlet weak var titleLogin: UILabel!
    @IBOutlet weak var titleFullname: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
