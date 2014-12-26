//
//  MusicPlayerViewController.swift
//  DJ Bot
//
//  Created by Jochem Toolenaar on 02/12/14.
//  Copyright (c) 2014 JTMS. All rights reserved.
//

import UIKit

class MusicPlayerViewController: UIViewController {
    @IBOutlet weak var loveButton: UIButton!

    @IBOutlet weak var trackTitle: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var playedLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    let player = MusicPlaybackController.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.makeTransparent()
        // Do any additional setup after loading the view.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateView", name: TrackChangedNotification, object: nil)
       updateView()
    }
    func updateView(){
        if let track = player.activeTrack{
            let url = NSURL(string: track.artworkUri!)
           
            artworkImageView.sd_setImageWithURL(url)
            
            trackTitle.text = track.title
            artistNameLabel.text = track.artistName
            
            
        }
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
        NSNotificationCenter.defaultCenter().removeObserver(self)
        
    }
    
    @IBAction func close(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        
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
