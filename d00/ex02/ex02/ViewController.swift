//
//  ViewController.swift
//  ex02
//
//  Created by Dieuson VIRGILE on 1/8/18.
//  Copyright © 2018 Dieuson VIRGILE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = "";
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnClick(_ sender: UIButton) {
        textLabel.text = (textLabel?.text)! + (sender.titleLabel?.text!)!;
        print("click on \((sender.titleLabel?.text!)!) concat to label")
    }
    
    @IBAction func uselessBtnClick(_ sender: UIButton) {
        print("click on \((sender.titleLabel?.text!)!) do nothing")
    }
    
}

