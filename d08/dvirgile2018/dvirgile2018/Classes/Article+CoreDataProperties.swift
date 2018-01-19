//
//  Article+CoreDataProperties.swift
//  dvirgile2018
//
//  Created by Dieuson VIRGILE on 1/19/18.
//
//

import Foundation
import CoreData


extension Article {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article")
    }

    @NSManaged public var content: String?
    @NSManaged public var creationDate: NSDate?
    @NSManaged public var image: NSData?
    @NSManaged public var language: String?
    @NSManaged public var title: String?
    @NSManaged public var updateDate: NSDate?

}
