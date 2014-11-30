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
    let title:String
    let date:NSDate
    var displayName:String{
        if let dateString = date.toDayString(){
            return dateString;
        }
        return "";
    }
    
    // MARK: init
    init(title:String,date:NSDate){
        self.title = title;
        self.date = date;
    }
}
