//
//  GenreCollectionViewController.swift
//  DJ Bot
//
//  Created by Jochem Toolenaar on 06/12/14.
//  Copyright (c) 2014 JTMS. All rights reserved.
//

import UIKit

class GenreCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    private let sectionInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    var genres :[BotGenre]?
    var selectedDay :BotDay?{
        didSet {
            self.title = selectedDay?.displayName
            self.genres = selectedDay?.featuredGenres
        }
    }
    
    // COLLECTION VIEW
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
    }
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let theGenres = genres{
            return theGenres.count
        }
        return 0
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("GenreCollectionCell", forIndexPath: indexPath) as GenreCollectionCell
        let genre = genres![indexPath.row]
        cell.setupCell(genre)
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "GenreSegue"){
            //get view controller and set the selected day
            let playlistController = segue.destinationViewController as PlaylistViewController
            let path = self.collectionView?.indexPathsForSelectedItems()[0] as NSIndexPath
            playlistController.genre = genres![path.row]
            playlistController.date = selectedDay?.date
            
        }
    }
    
    
    override func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
        
        let  cell = collectionView.cellForItemAtIndexPath(indexPath) as GenreCollectionCell
        cell.overlayView.backgroundColor = UIColor.whiteColor()
    }
    override func collectionView(collectionView: UICollectionView, didUnhighlightItemAtIndexPath indexPath: NSIndexPath) {
        
        let  cell = collectionView.cellForItemAtIndexPath(indexPath) as GenreCollectionCell
        cell.overlayView.backgroundColor = UIColor.blackColor()
    }

    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let screenRect = UIScreen.mainScreen().bounds
        let width = (screenRect.width / 2) - 0.5
        
        return CGSizeMake(width ,width)
    }
    
    func collectionView(collectionView: UICollectionView!,
        layout collectionViewLayout: UICollectionViewLayout!,
        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            return sectionInsets
    }
    
    
    
}
