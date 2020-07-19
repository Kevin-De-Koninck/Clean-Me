//
//  GreenButton.swift
//  Clean Me
//
//  Created by Kevin De Koninck on 19/07/2020.
//  Copyright © 2020 Kevin De Koninck. All rights reserved.
//

import Cocoa

class GreenButton: NSButton {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        if(InterfaceStyle().rawValue == "Dark"){
            self.layer?.backgroundColor = CGColor.init(red:0.33, green:0.64, blue:0.32, alpha:1.00)
        } else {
            self.layer?.backgroundColor = CGColor.init(red:0.33, green:0.64, blue:0.32, alpha:1.00)
        }
        self.layer?.cornerRadius = 15.0
    }
    
    override func awakeFromNib() {
        //text
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        self.attributedTitle = NSAttributedString(string: "Analyze", attributes: [ NSAttributedString.Key.foregroundColor : NSColor.white,
                                                                                   NSAttributedString.Key.paragraphStyle : style,
                                                                                   NSAttributedString.Key.font: NSFont(name: "Arial", size: 18)!])
    }
}
