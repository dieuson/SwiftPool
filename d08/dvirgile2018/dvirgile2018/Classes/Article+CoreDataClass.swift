//
//  Article+CoreDataClass.swift
//  dvirgile2018
//
//  Created by Dieuson VIRGILE on 1/19/18.
//
//

import Foundation
import CoreData


public class Article: NSManagedObject
{
    override public var description: String {
        return "Article :\nLanguage : \(self.language)\nTitle : \(self.title)\nContent : \(self.content)\nImage : \(self.image)\nCreation Date : \(self.creationDate)\nModification Date : \(self.updateDate)\n"
    }
}
