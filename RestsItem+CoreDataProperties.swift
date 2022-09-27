//
//  RestsItem+CoreDataProperties.swift
//  
//
//  Created by jpcm2 on 23/09/22.
//
//

import Foundation
import CoreData


extension RestsItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RestsItem> {
        return NSFetchRequest<RestsItem>(entityName: "RestsItem")
    }

    @NSManaged public var name: String?
    @NSManaged public var mood: String?

}
