//
//  PlaylistController.swift
//  PlaylistCoreData
//
//  Created by Darin Marcus Armstrong on 6/19/19.
//  Copyright © 2019 Darin Marcus Armstrong. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {
    
    static let sharedInstance = PlaylistController()
    
    var playlists: [Playlist] {
        let moc = CoreDataStack.context
        
        let fetchRequest: NSFetchRequest<Playlist> = Playlist.fetchRequest()
        
        let results = try? moc.fetch(fetchRequest)
        
        return results ?? []
    }
    
    func createPlaylistWith(name: String) {
        _ = Playlist(name: name)
        saveToPersistentStore()
    }
    
    func delete(playlist: Playlist) {
        let moc = CoreDataStack.context
        moc.delete(playlist)
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        let moc = CoreDataStack.context
        
        do {
            try moc.save()
        } catch {
            print("Error saving to persistent store. \(error.localizedDescription)")
        }
    }
    
    
    
    
    
}
