//
//  MusicPlayerViewController.swift
//  DJ Bot
//
//  Created by Jochem Toolenaar on 02/12/14.
//  Copyright (c) 2014 JTMS. All rights reserved.
//

import UIKit

class MusicPlayerViewController: UIViewController {

    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    let player = MusicPlaybackController.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK : actions
    @IBAction func skipToPrevious(sender: UIButton) {
        player.playPrevious()
    }
    
    @IBAction func skipToNext(sender: UIButton) {
        player.playNext()
    }
    
    @IBAction func togglePlayPause(sender: UIButton) {
        if(player.isPlaying){
            player.pause()
        }else{
            player.play()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
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
