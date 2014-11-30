//
//  DateExtension.swift
//  DJ Bot
//
//  Created by Jochem Toolenaar on 30/11/14.
//  Copyright (c) 2014 JTMS. All rights reserved.
//

import Foundation
extension NSDate{
    func toDayString()->NSString?{
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "d MMMM"
        return dateFormatter.stringFromDate(self)
    }
}
