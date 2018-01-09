//
//  ViewController.swift
//  ex01
//
//  Created by Dieuson VIRGILE on 1/8/18.
//  Copyright © 2018 Dieuson VIRGILE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clickButton(_ sender: UIButton) {
        helloLabel.text = "Hello World !"
    }
    
}

