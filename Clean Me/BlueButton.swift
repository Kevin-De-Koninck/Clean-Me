//
//  BlueButton.swift
//  Clean Me
//
//  Created by Kevin De Koninck on 17/01/2017.
//  Copyright © 2017 Kevin De Koninck. All rights reserved.
//

import Cocoa

class BlueButton: NSButton {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
    }
    
    override func awakeFromNib() {
        //GUI
        self.layer?.backgroundColor = CGColor.init(red: 45.0/255, green: 135.0/255, blue: 250.0/255, alpha: 1)
        self.layer?.cornerRadius = 15.0
        
        //text
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        self.attributedTitle = NSAttributedString(string: "Analyze", attributes: [ NSForegroundColorAttributeName : NSColor.white,
                                                                                   NSParagraphStyleAttributeName : style,
                                                                                   NSFontAttributeName: NSFont(name: "Arial", size: 18)!])
    }
}
