//
//  BotDay.swift
//  DJ Bot
//
//  Created by Jochem Toolenaar on 30/11/14.
//  Copyright (c) 2014 JTMS. All rights reserved.
//

import Foundation

class BotDay {
    
    // MARK: properties
    let id:String
    let date:NSDate
    let featuredGenres:[BotGenre]
    let featuredTracks:[BotTrack]
    var displayName:String{
        if let dateString = date.toDayString(){
            return dateString;
        }
        return "";
    }
    
    // MARK: init
    init(date:NSDate,id:String,featuredGenres:[BotGenre],featuredTracks:[BotTrack]){
        self.date = date;
        self.id = id;
        self.featuredGenres = featuredGenres
        self.featuredTracks = featuredTracks
    }
}
