//
//  AppDelegate.swift
//  Clean Me
//
//  Created by Kevin De Koninck on 17/01/2017.
//  Copyright © 2017 Kevin De Koninck. All rights reserved.
//

import Cocoa
import LetsMove

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    //Close app when closing window
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true;
    }
    
    func applicationWillFinishLaunching(_ notification: Notification) {
        PFMoveToApplicationsFolderIfNecessary()
    }
    
}
