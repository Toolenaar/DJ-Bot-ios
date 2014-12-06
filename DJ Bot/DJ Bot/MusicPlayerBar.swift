//
//  MusicPlayerBar.swift
//  DJ Bot
//
//  Created by Jochem Toolenaar on 01/12/14.
//  Copyright (c) 2014 JTMS. All rights reserved.
//

import UIKit

protocol MusicPlayerBarDelegate{
    func onMusicPlayerBarTapped(bar:MusicPlayerBar)
}
class MusicPlayerBar: UIView {
    var delegate:MusicPlayerBarDelegate?
    let player = MusicPlaybackController.sharedInstance
    
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var textContainerView: UIView!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
     class func loadFromNibNamed(nibNamed: String, bundle : NSBundle? = nil) -> MusicPlayerBar {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
            ).instantiateWithOwner(nil, options: nil)[0] as MusicPlayerBar
        
       
    }
    
    @IBAction func startPlayer(sender: AnyObject) {
        println("starting player")
        delegate?.onMusicPlayerBarTapped(self)
        
    }
    @IBAction func togglePlayPause(sender: AnyObject) {
        if(player.isPlaying){
            player.pause()
            playPauseButton.selected = true
        }else{
            player.play()
            playPauseButton.selected = false
        }
    }
    
}
