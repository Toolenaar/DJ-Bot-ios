//
//  DateExtension.swift
//  DJ Bot
//
//  Created by Jochem Toolenaar on 30/11/14.
//  Copyright (c) 2014 JTMS. All rights reserved.
//

import Foundation
extension String{
    func toDate(format:String = "dd-MM-yyyy")->NSDate?{
        var dateFormatter = NSDateFormatter() 
        dateFormatter.dateFormat = format
        var dateFromString = dateFormatter.dateFromString(self)
        return dateFromString
    }
}
