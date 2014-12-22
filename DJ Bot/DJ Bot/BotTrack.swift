//
//  BotTrack.swift
//  DJ Bot
//
//  Created by Jochem Toolenaar on 30/11/14.
//  Copyright (c) 2014 JTMS. All rights reserved.
//

import Foundation

func ==(lhs: BotTrack, rhs: BotTrack) -> Bool {
    return lhs.id == rhs.id
}
class BotTrack : Equatable {
   
    let title:String?
    let streamUri:String?
    let id:String?
    let artistName:String?
    let releaseDate:NSDate?
    let duration:Int = 0
    let artworkUri:String?
    var genre:String?
    var isLoved:Bool = false
    
    init(title:String?, streamUri:String?,id:String?,artistName:String?,releaseDate:NSDate?,duration:Int,artworkUri:String?,genre:String?){
        self.title = title;
        self.streamUri = streamUri
        self.id = id
        self.artistName = artistName
        self.releaseDate = releaseDate
        self.duration = duration
        self.artworkUri = artworkUri
        self.genre = genre
    }
}
