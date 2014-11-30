//
//  PlaylistViewController.swift
//  DJ Bot
//
//  Created by Jochem Toolenaar on 30/11/14.
//  Copyright (c) 2014 JTMS. All rights reserved.
//

import UIKit

class PlaylistViewController: UITableViewController {
    var genre:String?{
        didSet {
            self.title = genre
        }
    }
    var tracks:[BotTrack]?
    
    override func viewDidLoad() {
        var track1 = BotTrack(title: "Liedje")
        var track2 = BotTrack(title: "Liedje")
        var track3 = BotTrack(title: "Liedje")
        var track4 = BotTrack(title: "Liedje")
        tracks = [track1,track2,track3,track4]
    }
    
    //mark - tableview
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let activeTracks = tracks{
            return activeTracks.count
        }
        
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("TrackCell") as UITableViewCell
        var track = tracks![indexPath.row]
        cell.textLabel.text = track.title
        return cell;
    }
    
}
