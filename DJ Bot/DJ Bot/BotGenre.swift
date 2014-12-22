//
//  BotGenre.swift
//  DJ Bot
//
//  Created by Jochem Toolenaar on 22/12/14.
//  Copyright (c) 2014 JTMS. All rights reserved.
//

import Foundation
class BotGenre{
    
    let genre:String
    let thumbnailImageUrl:String
    
    init(genre:String,thumbnailImageUrl:String){
        self.genre = genre;
        self.thumbnailImageUrl = thumbnailImageUrl;
    }
}