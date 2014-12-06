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
        var url = NSURL(string: "https://i1.sndcdn.com/artworks-000096928229-4rjzyx-t500x500.jpg")
        featuredImageView.sd_setImageWithURL(url)
         titleLabel.text = day.displayName
        
        genreView.sizeToFit()
    }

}
