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
    let client:MSClient;
    
    init(){
         client = MSClient(applicationURLString: "https://djbot.azure-mobile.net/",
            applicationKey: "YRsVmjcxisOsdLXTcfJaqfrTbzfove24")
        
        
    }
    
    func getDays(startDate:NSDate,count:Int,onComplete:((NSArray!) -> Void)){
      
        var complete = {(result:NSData!,response:NSHTTPURLResponse!,error:NSError!) -> Void in
            if((error) != nil){
                
            }else{
                //parse objects
                var json = self.JSONParseArray(result as NSData)
                
                var days = [String]()
                for elem: AnyObject in json {
                    let date = elem["date"] as String
                    let id = elem["id"] as String
                    println("Date: \(date), Id: \(id)")
                    days += [date];
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
    
    func JSONParseArray(data: NSData) -> [AnyObject] {
        
        if let array = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: nil)  as? [AnyObject] {
            return array
        }
        
        return [AnyObject]()
    }
}