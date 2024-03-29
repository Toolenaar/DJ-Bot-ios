//
//  DayCell.swift
//  DJ Bot
//
//  Created by Jochem Toolenaar on 01/12/14.
//  Copyright (c) 2014 JTMS. All rights reserved.
//

import UIKit

class DayCell: UITableViewCell {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var featuredImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        featuredImageView.clipsToBounds = true

    }

    override func setSelected(selected: Bool, animated: Bool) {
        //  super.setSelected(selected, animated: animated)
        
    }
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
    }
    func setupCell(day:BotDay){
        //
        dayLabel.text = day.displayName
         let track = day.featuredTracks[0]
        var url = NSURL(string: track.artworkUri!)
        featuredImageView.sd_setImageWithURL(url)
        
    }

}
