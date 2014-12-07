//
//  UINavigationBarExtension.swift
//  DJ Bot
//
//  Created by Jochem Toolenaar on 07/12/14.
//  Copyright (c) 2014 JTMS. All rights reserved.
//

import Foundation

extension UINavigationBar{
    func makeTransparent(){
       
           
        
        self.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.shadowImage = UIImage()
        self.translucent = true
        
    }
    
}
