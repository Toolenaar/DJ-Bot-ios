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
        
       
        setIconOnNavBar()
        loadDays()
    }
    
    func loadDays(){
        let client = MobileServiceClient();
        client.getDays(NSDate(), count: 2) { (days) -> Void in
            
            self.days = days;
            self.tableView.reloadData()
            
        }
    }
    
    
    func setIconOnNavBar(){

        self.navigationItem.titleView?.clipsToBounds = true;
    }
    
    // MARK : view
    override func viewWillAppear(animated: Bool) {
        //test to show the view TODO: let it react to music playback and only show when playing music
      
      
    }
    
    
    // MARK : tableview
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let activeDays = days{
            return activeDays.count
        }
        
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if(indexPath.row == 0){
            var cell = tableView.dequeueReusableCellWithIdentifier("TodayCell") as TodayCell
            var day = days![indexPath.row]
            cell.setupCell(day)
            return cell
        }else{
            var cell = tableView.dequeueReusableCellWithIdentifier("DayCell") as DayCell
            var day = days![indexPath.row]
            cell.setupCell(day)
            
            return cell
        }    
       
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(indexPath.row == 0){
            return 178
        }else{
            return 64
        }
    }
    
    // MARK : segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "DaySegue"){
            //get view controller and set the selected day
            let genreController = segue.destinationViewController as GenreCollectionViewController
            let path = self.tableView.indexPathForSelectedRow()!
            genreController.selectedDay = days![path.row]
            
        }
    }

}
