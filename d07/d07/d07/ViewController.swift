//
//  ViewController.swift
//  d07
//
//  Created by Dieuson VIRGILE on 1/17/18.
//  Copyright © 2018 Dieuson VIRGILE. All rights reserved.
//

import UIKit
import RecastAI
import ForecastIO

class ViewController: UIViewController {

    @IBOutlet weak var userSentence: UITextField!
    @IBOutlet weak var responseLabel: UILabel!
    var bot : RecastAIClient?
    var client : DarkSkyClient?
    
    func displayResponse(sentence: String) {
        DispatchQueue.main.async {
            self.responseLabel.text = sentence
            print(sentence)
        }
    }
    
    @IBAction func requestClick(_ sender: UIButton) {
        let sentence = userSentence.text!
        if (sentence.isEmpty) {
            return self.displayResponse(sentence: "Error")
        }
        self.bot?.textRequest(sentence, successHandler: { (Response) in
            if (Response.get(entity: "location") == nil) {
                return self.displayResponse(sentence: "Error")
            }
            let lat = Response.get(entity: "location")!["lat"]
            let lon = Response.get(entity: "location")!["lng"]
            self.client?.getForecast(latitude: lat as! Double, longitude: lon as! Double) { result in
                switch result {
                case .success(let currentForecast, _):
                    self.displayResponse(sentence: (currentForecast.currently?.summary)!)
                case .failure( _):
                    self.displayResponse(sentence: "Error")
                }
            }
            
        }, failureHandle: { (Error) in
            return self.displayResponse(sentence: "Error")
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.client = DarkSkyClient(apiKey: "62303ab8c1669ccac457f2692b116ee7")
        self.client?.language = .english
        self.client?.units = .si
        self.bot = RecastAIClient(token : "c40f4594dcc6e44ce59d5d66d3f801e3", language: "en")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

