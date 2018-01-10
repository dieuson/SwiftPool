//
//  PeopleTableViewCell.swift
//  d02
//
//  Created by Dieuson VIRGILE on 1/10/18.
//  Copyright © 2018 Dieuson VIRGILE. All rights reserved.
//

import UIKit

class PeopleTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var deathDescription: UILabel!
    var person: (String, String)? {
        didSet {
            if person != nil {
                name.text = person?.0
                deathDescription.text = person?.1
            }
        }
    }
}
