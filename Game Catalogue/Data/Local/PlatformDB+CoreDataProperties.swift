//
//  PlatformDB+CoreDataProperties.swift
//  
//
//  Created by ilga yulian putra on 22/08/20.
//
//

import Foundation
import CoreData

extension PlatformDB {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PlatformDB> {
        return NSFetchRequest<PlatformDB>(entityName: "PlatformDB")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var slug: String?
    @NSManaged public var game: GameDB?

}
