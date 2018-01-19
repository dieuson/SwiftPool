//
//  ArticleManager.swift
//  dvirgile2018
//
//  Created by Dieuson VIRGILE on 1/19/18.
//

import Foundation
import CoreData

public class ArticleManager {
    public var managedObjectContext :NSManagedObjectContext
    
    public func save(){
        do {
            try self.managedObjectContext.save()
        } catch {
            fatalError("Failure to save context: \(error)")
        }
    }
    
    public func newArticle() -> Article {
        return NSEntityDescription.insertNewObject(forEntityName: "Article", into: (self.managedObjectContext)) as! Article
    }
    
     public func getArticles(withLang lang : String) -> [Article] {
        let allArticles = self.getAllArticles()
        var allArticlesWithLang: [Article] = []
        for art in allArticles
        {
            if let artLang = art.language
            {
                if artLang == lang
                {
                    allArticlesWithLang.append(art)
                }
            }
        }
        return allArticlesWithLang
    }
    
    public func getArticles(containString str : String) -> [Article] {
        let allArticles = self.getAllArticles()
        var allArticlesContainString: [Article] = []
        for art in allArticles
        {
            if let artContent = art.content
            {
                if artContent.contains(str)
                {
                    allArticlesContainString.append(art)
                    continue
                }
            }
            if let artTitle = art.title
            {
                if artTitle.contains(str)
                {
                    allArticlesContainString.append(art)
                    continue
                }
            }
        }
        return allArticlesContainString
    }
    
    public func removeArticle(article : Article) {
        self.managedObjectContext.delete(article)
        self.save()
    }
    
    public func getAllArticles() -> [Article] {
        var fetchedArticles: [Article] = []
        let articlesFetch = NSFetchRequest<Article>(entityName: "Article")
        
        do {
            fetchedArticles = try self.managedObjectContext.fetch(articlesFetch)
        } catch {
            fatalError("Failed to fetch articles: \(error)")
        }
        return fetchedArticles
    }
    
    public init(completionClosure: @escaping () -> ()) {
        print("Class init")
        let bundle = Bundle(for: ArticleManager.self)
        let modelURL = URL(fileURLWithPath: bundle.path(forResource: "article", ofType: "momd")!)
        guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Error initializing mom from: \(modelURL)")
        }
        
        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
        self.managedObjectContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = psc
        
        let queue = DispatchQueue.global(qos: DispatchQoS.QoSClass.background)
        queue.async {
            guard let docURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last else {
                fatalError("Unable to resolve document directory")
            }
            let storeURL = docURL.appendingPathComponent("article.sqlite")
            do {
                try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
                //The callback block is expected to complete the User Interface and therefore should be presented back on the main queue so that the user interface does not need to be concerned with which queue this call is coming from.
                DispatchQueue.main.sync(execute: completionClosure)
            } catch {
                fatalError("Error migrating store: \(error)")
            }
        }
    }
}
