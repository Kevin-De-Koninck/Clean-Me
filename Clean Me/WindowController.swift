//
//  WindowController.swift
//  Clean Me
//
//  Created by Kevin De Koninck on 18/01/2017.
//  Copyright © 2017 Kevin De Koninck. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
        if(InterfaceStyle().rawValue == "Dark"){
            self.window!.backgroundColor = NSColor.init(red: 0.216, green: 0.212, blue: 0.212, alpha: 1.0)
        } else {
            self.window!.backgroundColor = NSColor.white
        }
    }
    
}
