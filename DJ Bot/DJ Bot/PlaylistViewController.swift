//
//  PlaylistViewController.swift
//  DJ Bot
//
//  Created by Jochem Toolenaar on 30/11/14.
//  Copyright (c) 2014 JTMS. All rights reserved.
//

import UIKit

class PlaylistViewController: UITableViewController,PlaylistTrackCellDelegate {
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
        "https://api.soundcloud.com/tracks/108481211/stream?client_id=5be8a5639583c700d021ac61bd06437d",
        "https://api.soundcloud.com/tracks/130358643/stream?client_id=5be8a5639583c700d021ac61bd06437d",
        "https://api.soundcloud.com/tracks/156538707/stream?client_id=5be8a5639583c700d021ac61bd06437d",
        "https://api.soundcloud.com/tracks/129012594/stream?client_id=5be8a5639583c700d021ac61bd06437d",
        "https://api.soundcloud.com/tracks/12515330/stream?client_id=5be8a5639583c700d021ac61bd06437d",
        "https://api.soundcloud.com/tracks/108481211/stream?client_id=5be8a5639583c700d021ac61bd06437d"
        
    ]
    override func viewDidLoad() {
        for i in 0...testTracks.count-1{
            var track = BotTrack(title: "Track\(i)", streamUri: testTracks[i], id: "\(i)", artistName: "Artist\(i)", releaseDate: NSDate(), duration: 20,artworkUri:"https://i1.sndcdn.com/artworks-000099073750-4w1lhm-t300x300.jpg")
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
        var cell = tableView.dequeueReusableCellWithIdentifier("TrackCell") as PlaylistTrackCell
        var track = tracks[indexPath.row]
        cell.setupView(track)
        cell.delegate = self
        return cell;
    }
    
    func trackCellMoreTapped(cell: PlaylistTrackCell) {
        showActionSheet(cell)
    }
    func showActionSheet(cell: PlaylistTrackCell){
       
        var title = "Love"
        if let theTrack = cell.track{
            if(theTrack.isLoved){
                title = "Unlove this track"
            }
            var alert = UIAlertController(title: "Options", message: "What do you want to do with \(theTrack.title)", preferredStyle: UIAlertControllerStyle.ActionSheet)
            alert.view.tintColor = UIColor.djBotRed()
            var action = UIAlertAction(title: title, style: UIAlertActionStyle.Default,handler:{(alert: UIAlertAction!) in self.saveToLoved(cell)})
            alert.addAction(action)
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
                // ...
            }

            alert.addAction(cancelAction)
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
    }
    
    func saveToLoved(cell: PlaylistTrackCell){
        
        if(cell.track!.isLoved){
                //TODO:remove from loved
           
        }else{
                //TODO:add to loved
           
        }
         cell.toggleLoved()
        
    }
    
}
