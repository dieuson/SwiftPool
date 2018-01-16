//
//  PlaceTableViewCell.swift
//  d05
//
//  Created by Dieuson VIRGILE on 1/15/18.
//  Copyright © 2018 Dieuson VIRGILE. All rights reserved.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {

    @IBOutlet weak var PlaceName: UILabel!

    var index = 0
    var title: String? {
        didSet {
            PlaceName.text = title
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
