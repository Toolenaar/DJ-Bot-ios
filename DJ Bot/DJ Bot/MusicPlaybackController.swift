//
//  MusicPlaybackController.swift
//  DJ Bot
//
//  Created by Jochem Toolenaar on 02/12/14.
//  Copyright (c) 2014 JTMS. All rights reserved.
//
import AVFoundation
import MediaPlayer
import Foundation
import UIKit

// TODO: move to a class var when it becomes available in swift
let TrackChangedNotification:String = "TrackChangedNotification"
let TrackFinishedPlayingNotification:String = "TrackFinishedPlayingNotification"
let TrackPlayedNotification:String = "TrackPlayedNotification"
let TrackPausedNotification:String = "TrackPausedNotification"

class MusicPlaybackController {
    
    // MARK : class properties
    
    
    // MARK : properties
    var player:AVPlayer?
    var playerItem:AVPlayerItem?
    var session:AVAudioSession {
        get{
            return AVAudioSession.sharedInstance()
        }
        
    }
    var isPlaying:Bool {
        get{
            return player?.rate != 0
        }
    }
    var isInitialized:Bool = false
    var playlist:[BotTrack]?{
        didSet{
          skipToIndex(0)
        }
    }
    var activeTrack:BotTrack?
    //TODO : implement a better wayhttp://stackoverflow.com/questions/24028860/how-to-find-index-of-list-item-in-apples-swift/24029119#24029119
    var currentIndex:Int{
        get{
            if let activePlaylist = playlist{
                if let currentTrack = activeTrack{
                    var i = 0
                    for track in activePlaylist{
                        if(track == currentTrack){
                            return i
                        }
                        i++
                    }
                }
            }
            return 0;
        }
        
    }
    
    // MARK : setup and interruption handling
    func setupAudioSession(){
        var error: NSError?
        session.setCategory(AVAudioSessionCategoryPlayback, error: &error)
        session.setActive(true, error: nil)
        UIApplication.sharedApplication().beginReceivingRemoteControlEvents()
        self.isInitialized = true
    }
    
    // MARK : playback
    func pause(){
        player?.pause()
        notify(TrackPausedNotification)
    }
    
    func play(){
        player?.play()
        notify(TrackPlayedNotification)
    }
    
    func playNext(){
        if let activePlaylist = playlist{
            var nextIndex = currentIndex+1
            var playlistSize = activePlaylist.count
            
            if(nextIndex >= playlistSize){nextIndex = 0};
            skipToIndex(nextIndex)
        }
        
    
    }
    
    func playPrevious(){
        if let activePlaylist = playlist{
            var previousIndex = currentIndex - 1
            if(previousIndex < 0){previousIndex = activePlaylist.count - 1}
            skipToIndex(previousIndex)
        }
        
    }
    
    func skipToIndex(index:Int){
        if let activePlaylist = playlist{
            activeTrack = activePlaylist[index]
            
            var streamUri = activeTrack?.streamUri
            
            if let uri = streamUri{
                startPlaying(uri)
            }
            
        }
    }
    func seekToPosition(time:CMTime){
        player?.seekToTime(time)
        play()
        setupInfoCenter()
    }
    
    func startPlaying(uri:String){
        //setup url
        var url = NSURL(string: uri)
        var asset = AVURLAsset(URL: url, options: nil)
        //setup player item
        playerItem = AVPlayerItem(asset: asset)
        player = AVPlayer(playerItem: playerItem)
        
        //add observer to track ended notification
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "itemDidFinishPlaying", name: AVPlayerItemDidPlayToEndTimeNotification, object: playerItem)
        
        //information showed on locked phone
        //setupInfoCenter()
        play()
        trackDidChange()
        
    }
    func itemDidFinishPlaying(notification:NSNotification){
        playNext()
        notify(TrackFinishedPlayingNotification)
    }
    
    
    func trackDidChange(){
        notify(TrackChangedNotification)
    }
    
    
    // MARK : utils
    func setupInfoCenter(){
        if let track = activeTrack{
            var infoCenter = MPNowPlayingInfoCenter.defaultCenter()
            if((infoCenter) != nil){
                //var songInfoDict :Dictionary[] = Dictionary()
                infoCenter.nowPlayingInfo = getSongInfoForCurrentTrack(track)
                
                //todo add image
                
            }
        }
        
    }
    func getSongInfoForCurrentTrack(track:BotTrack) -> Dictionary<NSObject,AnyObject>{
        
        var currentTime = 0 as Float64;
        if let activePlayer = player{
            currentTime = CMTimeGetSeconds(activePlayer.currentTime())
        }
        
        
        return [
            MPMediaItemPropertyTitle:track.title!,
            MPMediaItemPropertyArtist:track.artistName!,
            MPMediaItemPropertyPlaybackDuration:track.duration,
            MPNowPlayingInfoPropertyPlaybackRate:NSNumber(),
            MPNowPlayingInfoPropertyElapsedPlaybackTime:currentTime
        ]
        
    }
    
    
    func notify(notificationIdentifier:String){
        NSNotificationCenter.defaultCenter().postNotificationName(notificationIdentifier, object: nil)
    }
    
    
    // MARK : singleton http://code.martinrue.com/posts/the-singleton-pattern-in-swift
    class var sharedInstance: MusicPlaybackController{
        struct Static {
            static var instance: MusicPlaybackController?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = MusicPlaybackController()
        }
        
        return Static.instance!
    }
}
