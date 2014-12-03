//
//  MusicPlayerBar.swift
//  DJ Bot
//
//  Created by Jochem Toolenaar on 01/12/14.
//  Copyright (c) 2014 JTMS. All rights reserved.
//

import UIKit

class MusicPlayerBar: UIView {
    
     class func loadFromNibNamed(nibNamed: String, bundle : NSBundle? = nil) -> MusicPlayerBar {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
            ).instantiateWithOwner(nil, options: nil)[0] as MusicPlayerBar
    }
    
    @IBAction func startPlayer(sender: AnyObject) {
        println("starting player")
    }
    
}
