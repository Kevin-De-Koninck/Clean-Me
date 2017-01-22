//
//  AboutViewController.swift
//  Clean Me
//
//  Created by Kevin De Koninck on 22/01/2017.
//  Copyright © 2017 Kevin De Koninck. All rights reserved.
//

import Cocoa

class AboutViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        self.view.wantsLayer = true
    }
    
    override func awakeFromNib() {
        if self.view.layer != nil {
            let color : CGColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.view.layer?.backgroundColor = color
        }
    }
    
    
    @IBAction func githubBtnClicked(_ sender: Any) {
        if let url = URL(string: "https://github.com/Kevin-De-Koninck/Clean-Me"), NSWorkspace.shared().open(url) {
            print("default browser was successfully opened")
        }
    }
    
    @IBAction func kBtnClicked(_ sender: Any) {
        if let url = URL(string: "https://kevindekoninck.com"), NSWorkspace.shared().open(url) {
            print("default browser was successfully opened")
        }
    }
}
