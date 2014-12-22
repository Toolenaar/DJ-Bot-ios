//
//  BotPlaylist.swift
//  DJ Bot
//
//  Created by Jochem Toolenaar on 30/11/14.
//  Copyright (c) 2014 JTMS. All rights reserved.
//

import Foundation
class BotPlaylist {
    let genre:String
    let id:String
    let date:NSDate
    let tracks:[BotTrack]
    
    init(genre:String,id:String,date:NSDate,tracks:[BotTrack]){
        self.genre = genre
        self.id = id
        self.tracks = tracks
        self.date = date
    }
}
