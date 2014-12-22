//
//  TodayCell.swift
//  DJ Bot
//
//  Created by Jochem Toolenaar on 01/12/14.
//  Copyright (c) 2014 JTMS. All rights reserved.
//

import UIKit
class TodayCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var featuredImageView: UIImageView!
    
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var trackTitleLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var genreView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        featuredImageView.clipsToBounds = true
        genreView.layer.cornerRadius = 4.0
    }

    override func setSelected(selected: Bool, animated: Bool) {
      //  super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        //
       
        
        
    }
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
    }
    
    func setupCell(day:BotDay){
        
        let track = day.featuredTracks[0]
        
        var url = NSURL(string: track.artworkUri!)
        featuredImageView.sd_setImageWithURL(url)
        titleLabel.text = day.displayName
        trackTitleLabel.text = track.title
        artistNameLabel.text = track.artistName
        genreLabel.text = track.genre
        
        genreView.sizeToFit()
    }

}
