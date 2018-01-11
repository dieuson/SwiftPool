//
//  whoWillDieViewController.swift
//  DeathNote
//
//  Created by Dieuson VIRGILE on 1/11/18.
//  Copyright © 2018 Dieuson VIRGILE. All rights reserved.
//

import UIKit

class whoWillDieViewController: UIViewController {

    @IBOutlet weak var deathDate: UIDatePicker!
    @IBOutlet weak var deadName: UITextField!
    @IBOutlet weak var deathCause: UITextField!

//    prepareforse
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "View Controller"){
            let name = deadName.text!
            let cause = deathCause.text!
            let date = deathDate.date
            let formater = DateFormatter()
            formater.dateFormat = "dd/MM/yyyy HH:mm:ss"
            
            if (!name.isEmpty && deathDate.date >= Date()){
                let vc = segue.destination as? ViewController
                vc?.people = (name, cause, formater.string(from: date))
                print("Name: \(name)")
                print("Cause: \(cause)")
                print("Date: \(formater.string(from: date))")
            } else {
                print("No one will die")
            }
        }
    }
    
    @IBAction func unWindSegue(segue: UIStoryboardSegue){
        performSegue(withIdentifier: "View Controller", sender: "Foo")
    }
    
    @IBAction func dateChange(_ sender: UIDatePicker) {
        if (deathDate.date < Date()){
            deathDate.date = Date();
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deathDate.date = Date();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
