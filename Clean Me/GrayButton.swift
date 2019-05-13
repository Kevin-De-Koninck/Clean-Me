//
//  GrayButton.swift
//  Clean Me
//
//  Created by Kevin De Koninck on 17/01/2017.
//  Copyright © 2017 Kevin De Koninck. All rights reserved.
//

import Cocoa

class GrayButton: NSButton {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        if(InterfaceStyle().rawValue == "Dark"){
            self.layer?.backgroundColor = CGColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.3)
        } else {
            self.layer?.backgroundColor = CGColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 0.3)
        }
        self.layer?.cornerRadius = 15.0
    }
}
