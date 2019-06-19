//
//  SongController.swift
//  PlaylistCoreData
//
//  Created by Darin Marcus Armstrong on 6/19/19.
//  Copyright © 2019 Darin Marcus Armstrong. All rights reserved.
//

import Foundation
import CoreData

class SongController {
    
    static let sharedInstance = SongController()
    
    func createSongWith(title: String, artist: String, playlist: Playlist) {
        
        let _ = Song(title: title, artist: artist, playlist: playlist)
        PlaylistController.sharedInstance.saveToPersistentStore()
    }
    
    func delete(song: Song) {
        let moc = CoreDataStack.context
        
        moc.delete(song)
        
        PlaylistController.sharedInstance.saveToPersistentStore()
    }
}
