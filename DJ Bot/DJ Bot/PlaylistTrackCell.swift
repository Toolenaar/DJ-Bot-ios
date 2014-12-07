//
//  PlaylistTrackCell.swift
//  DJ Bot
//
//  Created by Jochem Toolenaar on 07/12/14.
//  Copyright (c) 2014 JTMS. All rights reserved.
//

import UIKit
import Foundation


protocol PlaylistTrackCellDelegate{
    func trackCellMoreTapped(cell:PlaylistTrackCell)
}

class PlaylistTrackCell: UITableViewCell {
    
    
    @IBOutlet weak var textContainerView: UIView!
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var trackTitleLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var lovedImageView: UIImageView!
    var track:BotTrack?
    var delegate:PlaylistTrackCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        artworkImageView.clipsToBounds = true;
        self.preservesSuperviewLayoutMargins = false
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
         super.setSelected(selected, animated: animated)
  
    }
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
    }
    
    func setupView(track:BotTrack){
        self.track = track
        let uri = NSURL(string: track.artworkUri)
        artworkImageView.sd_setImageWithURL(uri)
        
        artistNameLabel.text = track.artistName
        trackTitleLabel.text = track.title
        
        textContainerView.sizeToFit()
        
        lovedImageView.hidden = !track.isLoved
    }
    @IBAction func showMenu(sender: AnyObject) {
        delegate?.trackCellMoreTapped(self)
    }
    
    func toggleLoved(){
        if let theTrack = track{
            theTrack.isLoved = !theTrack.isLoved
            lovedImageView.hidden = !theTrack.isLoved
        }
    }
    
    
}
