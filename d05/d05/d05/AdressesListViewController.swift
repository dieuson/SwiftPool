//
//  SecondViewController.swift
//  d05
//
//  Created by Dieuson VIRGILE on 1/15/18.
//  Copyright © 2018 Dieuson VIRGILE. All rights reserved.
//

import UIKit

class AdressesListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let place = DataPlaces.places[indexPath.row]
        let cel = tableView.dequeueReusableCell(withIdentifier: "adresseCell") as! PlaceTableViewCell
        cel.title = place.title
        return cel
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Is select: \(DataPlaces.places[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataPlaces.places.count
    }
    

}

