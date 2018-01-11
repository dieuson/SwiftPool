//
//  ViewController.swift
//  DeathNote
//
//  Created by Dieuson VIRGILE on 1/11/18.
//  Copyright © 2018 Dieuson VIRGILE. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var allPeople :[(String, String, String)] = Data.People
    var people: (String, String, String)?
   
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self;
            tableView.dataSource = self;
        }
    }
    
    @IBAction func unWindToHomeSegue(segue: UIStoryboardSegue){

        print(allPeople)
        allPeople.append(people!)
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: allPeople.count - 1, section: 0)], with: .automatic)
        tableView.endUpdates()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.People.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PeopleCell") as! PeopleTableViewCell
//        cell.person = Data.People[indexPath.row]
        cell.person = allPeople[indexPath.row];
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(allPeople)
//        allPeople = Data.People
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

