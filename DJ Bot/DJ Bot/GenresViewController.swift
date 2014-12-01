//
//  GenresViewController.swift
//  DJ Bot
//
//  Created by Jochem Toolenaar on 30/11/14.
//  Copyright (c) 2014 JTMS. All rights reserved.
//

import UIKit

class GenresViewController: UITableViewController {
    
    let genres :[String] = ["Techno","Deep House","Minimal"]
    var selectedDay :BotDay?{
        didSet {
            self.title = selectedDay?.displayName
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //mark - tableview
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genres.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("GenreCell") as GenreCell
        cell.titleLabel.text = genres[indexPath.row]
        return cell;
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "GenreSegue"){
            //get view controller and set the selected day
            let playlistController = segue.destinationViewController as PlaylistViewController
            let path = self.tableView.indexPathForSelectedRow()!
            playlistController.genre = genres[path.row]
            
        }
    }
}
