import Foundation
import CoreData

@objc(RestsItem)
public class RestsItem: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<RestsItem> {
        return NSFetchRequest<RestsItem>(entityName: "RestsItem")
    }

    @NSManaged public var mood: String?
    @NSManaged public var name: String?
}
