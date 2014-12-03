//
//  MusicBarNavigationController.swift
//  DJ Bot
//
//  Created by Jochem Toolenaar on 01/12/14.
//  Copyright (c) 2014 JTMS. All rights reserved.
//

import UIKit

class MusicBarNavigationController: UINavigationController {
 
    lazy var musicPlayerBar:MusicPlayerBar = {
        
        var  bar = MusicPlayerBar.loadFromNibNamed("MusicPlayerBar", bundle: nil)
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        bar.frame = CGRectMake(0, screenSize.height - 50, screenSize.width, 50)
        self.view.addSubview(bar)
        bar.hidden = true
        
        return bar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK : music player
    func showMusicPlayerBar(){
        musicPlayerBar.hidden = false;
    }
    
    func hideMusicPlayerBar(){
        musicPlayerBar.hidden = true;
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
