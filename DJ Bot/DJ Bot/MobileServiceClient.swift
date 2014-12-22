//
//  MobileServiceClient.swift
//  DJ Bot
//
//  Created by Jochem Toolenaar on 21/12/14.
//  Copyright (c) 2014 JTMS. All rights reserved.
//

import Foundation

class MobileServiceClient{
    
    let dayUri = "Day";
    let playlistUri = "Playlist"
    let dayFormat = "yyyy-mm-dd";
    let client:MSClient;
    
    init(){
         client = MSClient(applicationURLString: "https://djbot.azure-mobile.net/",
            applicationKey: "YRsVmjcxisOsdLXTcfJaqfrTbzfove24")
        
        
    }
    // MARK : calls
    func getPlaylist(date:NSDate,genre:BotGenre,onComplete:((BotPlaylist?) -> Void)){
        var complete = {(result:NSData!,response:NSHTTPURLResponse!,error:NSError!) -> Void in
            if((error) != nil){
                //TODO error handling
            }else{
                //parse objects
                var json = self.parseJSONDictionary(result as NSData)
                
              
                onComplete(self.parsePlaylist(json))
                
            }
        }
    
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = dayFormat
        let dateString = dateFormatter.stringFromDate(date)
        
        callUri(playlistUri, parameters: ["date":dateString,"genre":genre.genre], onComplete: complete)
    }
    func getDays(startDate:NSDate,count:Int,onComplete:(([BotDay]?) -> Void)){
      
        var complete = {(result:NSData!,response:NSHTTPURLResponse!,error:NSError!) -> Void in
            if((error) != nil){
                //TODO error handling
            }else{
                //parse objects
                var json = self.parseJSONArray(result as NSData)
                
                var days = [BotDay]()
                for elem: AnyObject in json {
                    
                    days += [self.parseDay(elem)];
                }
                onComplete(days)
                
            }
        }
        
        callUri(dayUri, parameters: Dictionary<String,String>(),onComplete: complete)
        
        
        //onComplete(days: new NSArray())
    }
    
    func callUri(resource:String,parameters:Dictionary<String,String>,onComplete:(result:NSData!,response:NSHTTPURLResponse!,error:NSError!) -> Void){
        client.invokeAPI(resource, data: nil, HTTPMethod: "GET", parameters: parameters, headers: Dictionary<String,String>(),completion:onComplete)
        
      
    }
    
    // MARK : properties
    func parseJSONArray(data: NSData) -> [AnyObject] {
        
        if let array = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: nil)  as? [AnyObject] {
            return array
        }
        
        return [AnyObject]()
    }
    func parseJSONDictionary(data: NSData) -> Dictionary<String, AnyObject> {
        
        if let dict = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: nil)  as? Dictionary<String, AnyObject>{
            return dict
        }
        
        return Dictionary<String, AnyObject>()
    }
    
    
    func parsePlaylist(root:Dictionary<String, AnyObject>) -> BotPlaylist{
       
        let jsonArray = root["queryable"] as [AnyObject]
        let json = jsonArray[0] as Dictionary<String, AnyObject>
        
        let genre = json["genre"] as String
        let id = json["id"] as String
        let dateString = json["date"] as String
        let date = parseDate(dateString)
        
        let tracksArray = json["tracks"] as NSArray
        var tracks = [BotTrack]()
        for track:AnyObject in tracksArray{
            tracks += [parseTrack(track)]
        }
        
        return BotPlaylist(genre: genre, id: id, date: date, tracks: tracks)
        
    }
    
    func parseDay(json:AnyObject) -> BotDay{
        
        
        let id = json["id"] as String
        let dateString = json["date"] as String
        
        //parse featured genres
        let genresArray = json["featuredGenre"] as NSArray
        var genres = [BotGenre]()
        for genre:AnyObject in genresArray{
            genres += [parseFeaturedGenre(genre)]
        }
        
        //parse featured tracks
        let tracksArray = json["featuredTracks"] as NSArray
        var tracks = [BotTrack]()
        for track:AnyObject in tracksArray{
            tracks += [parseTrack(track)]
        }
        
        return BotDay(date: parseDate(dateString), id: id,featuredGenres: genres,featuredTracks: tracks)
        
    }
    
    func parseTrack(json:AnyObject)->BotTrack{
        
        let title = json["title"] as String?
        let artworkImage = json["artworkImageUrl"] as String?
        let artistname = json["artistName"] as String?
        let genre = json["genre"] as String?
        let streamUri = json["streamUrl"] as String?
        let id = json["id"] as String?
        var duration = json["duration"] as Int?
        if(duration == nil){duration = 0}
        
        return BotTrack(title: title, streamUri: streamUri, id: id, artistName: artistname, releaseDate: NSDate(), duration: duration!, artworkUri: artworkImage,genre:genre)
    }
    
    func parseFeaturedGenre(json:AnyObject)->BotGenre{
        
        let genre = json["genre"] as String
        let thumbnail = json["thumbnailImageUrl"] as String
        
        return BotGenre(genre: genre, thumbnailImageUrl: thumbnail)
    }
    
    func parseDate(dateString:String)->NSDate{
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = dayFormat
        let date = dateFormatter.dateFromString(dateString)
        return date!;
    }
}