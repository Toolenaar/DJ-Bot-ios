//
//  CalendarViewController.swift
//  DJ Bot
//
//  Created by Jochem Toolenaar on 30/11/14.
//  Copyright (c) 2014 JTMS. All rights reserved.
//

import UIKit


class CalendarViewController: UITableViewController {
    
    var days :[BotDay]?
    var selectedDay:BotDay?
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //test days
        var botDay1 = BotDay(title: "SomeDay", date: "30-11-2014".toDate(format: "dd-MM-yyyy")!)
        var botDay2 = BotDay(title: "SomeDay", date: "29-11-2014".toDate(format: "dd-MM-yyyy")!)
        var botDay3 = BotDay(title: "SomeDay", date: "28-11-2014".toDate(format: "dd-MM-yyyy")!)
        days = [botDay1,botDay2,botDay3]

    }
    
    // MARK : tableview
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let activeDays = days{
            return activeDays.count
        }
        
        return 0
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("CalendarCell") as UITableViewCell
        var day = days![indexPath.row]
        cell.textLabel.text = day.displayName;
        return cell;
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "DaySegue"){
            //get view controller and set the selected day
            let genreController = segue.destinationViewController as GenresViewController
            let path = self.tableView.indexPathForSelectedRow()!
            genreController.selectedDay = days![path.row]
            
        }
    }

}
