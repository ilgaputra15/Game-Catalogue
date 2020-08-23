//
//  GameDB+CoreDataProperties.swift
//  
//
//  Created by ilga yulian putra on 22/08/20.
//
//

import Foundation
import CoreData

extension GameDB {

    @nonobjc public class func fetchDataRequest() -> NSFetchRequest<GameDB> {
        return NSFetchRequest<GameDB>(entityName: "GameDB")
    }
    
    @nonobjc public class func fetchDeleteRequest() -> NSFetchRequest<NSFetchRequestResult> {
        return NSFetchRequest<NSFetchRequestResult>(entityName: "GameDB")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var released: String?
    @NSManaged public var backgroundUrl: String?
    @NSManaged public var rating: Double
    @NSManaged public var added: Int32
    @NSManaged public var platform: NSSet

}

// MARK: Generated accessors for platform
extension GameDB {

    @objc(addPlatformObject:)
    @NSManaged public func addToPlatform(_ value: PlatformDB)

    @objc(removePlatformObject:)
    @NSManaged public func removeFromPlatform(_ value: PlatformDB)

    @objc(addPlatform:)
    @NSManaged public func addToPlatform(_ values: NSSet)

    @objc(removePlatform:)
    @NSManaged public func removeFromPlatform(_ values: NSSet)

}
