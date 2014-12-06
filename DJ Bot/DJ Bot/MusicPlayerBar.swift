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
    
}
