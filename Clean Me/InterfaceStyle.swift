//
//  InterfaceStyle.swift
//  Clean Me
//
//  Created by Kevin De Koninck on 13/05/2019.
//  Copyright © 2019 Kevin De Koninck. All rights reserved.
//

import Foundation

enum InterfaceStyle : String {
    case Dark, Light
    
    init() {
        let type = UserDefaults.standard.string(forKey: "AppleInterfaceStyle") ?? "Light"
        self = InterfaceStyle(rawValue: type)!
    }
}
