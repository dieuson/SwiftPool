//
//  ViewController.swift
//  dvirgile2018
//
//  Created by dieuson on 01/18/2018.
//  Copyright (c) 2018 dieuson. All rights reserved.
//

import UIKit
import dvirgile2018
import CoreData

class ViewController: UIViewController {
    var articleManager: ArticleManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.articleManager = ArticleManager(completionClosure: {
            DispatchQueue.main.async {
                self.launchDemo()
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func launchDemo()
    {
        
        if let article = self.articleManager?.newArticle() {
            article.title = "Bonjour monde 1"
            article.content = "article content"
            article.language = "en"
            article.image = nil
            article.creationDate = NSDate()
            article.updateDate = NSDate()
        }
        if let article1 = self.articleManager?.newArticle() {
            article1.title = "Bonjour monde 2"
            article1.content = "article2 content"
            article1.language = "fr"
            article1.image = nil
            article1.creationDate = NSDate()
            article1.updateDate = NSDate()
        }
        self.articleManager?.save()
        let allArticles = self.articleManager?.getAllArticles()
        print("Display articles")
        for article in allArticles! {
            print("\(article.description)")
        }
    }
}

