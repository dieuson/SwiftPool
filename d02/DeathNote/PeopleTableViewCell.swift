//
//  PeopleTableViewCell.swift
//  DeathNote
//
//  Created by Dieuson VIRGILE on 1/11/18.
//  Copyright © 2018 Dieuson VIRGILE. All rights reserved.
//

import UIKit

class PeopleTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var deathDescription: UILabel!
    @IBOutlet weak var deathTime: UILabel!
    
    var person: (String, String, String)? {
        didSet {
            if person != nil {
                name.text = person?.0
                deathDescription.text = person?.1
                deathTime.text = person?.2
            }
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
