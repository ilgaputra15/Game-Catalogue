//
//  GameDBProvider.swift
//  Game Catalogue
//
//  Created by ilga yulian putra on 23/08/20.
//  Copyright © 2020 ilga yulian putra. All rights reserved.
//

import Foundation
import CoreData

class GameDBProvider {
    
    static var shared: GameDBProvider = {
        let gameDBProvider = GameDBProvider()
        return gameDBProvider
    }()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "GameFavorite")
        container.loadPersistentStores { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = false
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        container.viewContext.shouldDeleteInaccessibleFaults = true
        container.viewContext.undoManager = nil
        return container
    }()
    
    private func managedObjectContext() -> NSManagedObjectContext {
        let taskContext = persistentContainer.newBackgroundContext()
        taskContext.undoManager = nil
        taskContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        return taskContext
    }
    
    func saveGame(game: GameDetail, competion: @escaping(_ isSave: Bool) -> Void) {
        let context = managedObjectContext()
        context.performAndWait {
            var platforms = [PlatformDB]()
            game.platforms?.forEach({ (platform) in
                let platformDB = PlatformDB(context: context)
                platformDB.id = Int32(platform.platform.id)
                platformDB.name = platform.platform.name
                platformDB.slug = platform.platform.slug
                platforms.append(platformDB)
            })
            
            let gameDB = GameDB(context: context)
            gameDB.id = Int32(game.id)
            gameDB.name = game.name
            gameDB.released = game.released
            gameDB.rating = game.rating ?? 0
            gameDB.backgroundUrl = game.backgroundImage
            gameDB.added = Int32(game.added ?? 0)
            gameDB.platform = NSSet.init(array: platforms)
            
            guard context.hasChanges else {
                competion(false)
                return
            }
            do {
                try context.save()
                competion(true)
            } catch let error as NSError {
                competion(false)
                fatalError("Could not save. \(error), \(error.userInfo)")
            }
        }
        
    }
    
    func getGameFromLocal(id: Int, completion: @escaping(_ game: Game?) -> Void) {
        let context = managedObjectContext()
        context.performAndWait {
            let fetchRequest = GameDB.fetchDataRequest()
            fetchRequest.fetchLimit = 1
            fetchRequest.predicate = NSPredicate(format: "id == \(id)")
            do {
                if let result = try context.fetch(fetchRequest).first {
                    let game = Game(
                        id: Int(result.id),
                        name: result.name ?? "",
                        released: result.released,
                        backgroundImage: result.backgroundUrl,
                        rating: result.rating, added: Int(result.added),
                        platforms: nil)
                    completion(game)
                } else {
                    completion(nil)
                }
            } catch let error as NSError {
                completion(nil)
                print("Could not fetch. \(error), \(error.userInfo)")
            }
        }
    }
    
    func isGameFovorite(id: Int, competion: @escaping(_ isFavorite: Bool) -> Void) {
        getGameFromLocal(id: id) { (game) in
            competion(game != nil)
        }
    }
    
    func deleteGameFromLocal(id: Int, completion: @escaping(_ isDelete: Bool) -> Void) {
        let context = managedObjectContext()
        context.performAndWait {
            let fetchRequest = GameDB.fetchDeleteRequest()
            fetchRequest.predicate = NSPredicate(format: "id == \(id)")
            let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            batchDeleteRequest.resultType = .resultTypeCount
            if let batchDeleteResult = try? context.execute(batchDeleteRequest) as? NSBatchDeleteResult,
                batchDeleteResult.result != nil {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
