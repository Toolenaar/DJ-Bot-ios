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
    var tracks:[BotTrack] = []
    let testTracks:[String] = [
        "https://api.soundcloud.com/tracks/130358643/stream?client_id=5be8a5639583c700d021ac61bd06437d",
        "https://api.soundcloud.com/tracks/156538707/stream?client_id=5be8a5639583c700d021ac61bd06437d",
        "https://api.soundcloud.com/tracks/129012594/stream?client_id=5be8a5639583c700d021ac61bd06437d",
        "https://api.soundcloud.com/tracks/12515330/stream?client_id=5be8a5639583c700d021ac61bd06437d",
        "https://api.soundcloud.com/tracks/108481211/stream?client_id=5be8a5639583c700d021ac61bd06437d"
        
    ]
    override func viewDidLoad() {
        for i in 0...testTracks.count-1{
            var track = BotTrack(title: "Track\(i)", streamUri: testTracks[i], id: "\(i)", artistName: "Artist\(i)", releaseDate: NSDate(), duration: 20)
            tracks += [track]
        }
        
    }
    
    //mark - tableview
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

       return tracks.count

    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        MusicPlaybackController.sharedInstance.playlist = tracks
      
        (self.navigationController as MusicBarNavigationController).showMusicPlayerBar()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("TrackCell") as UITableViewCell
        var track = tracks[indexPath.row]
        cell.textLabel?.text = track.title
        return cell;
    }
    
}
