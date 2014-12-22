//
//  GenreCollectionCell.swift
//  DJ Bot
//
//  Created by Jochem Toolenaar on 06/12/14.
//  Copyright (c) 2014 JTMS. All rights reserved.
//

import UIKit

class GenreCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var overlayView: UIView!
    
    override func awakeFromNib() {
        featuredImageView.clipsToBounds = true
    }
    func setupCell(genre:BotGenre){
        titleLabel.text = genre.genre.uppercaseString
        var url = NSURL(string: genre.thumbnailImageUrl)
        featuredImageView.sd_setImageWithURL(url)

    }
    
}
