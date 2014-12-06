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
    func setupCell(genre:String,imgUri:String){
        titleLabel.text = genre.uppercaseString
        var url = NSURL(string: imgUri)
        featuredImageView.sd_setImageWithURL(url)

    }
    
}
