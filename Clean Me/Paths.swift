//
//  Commands.swift
//  Clean Me
//
//  Created by Kevin De Koninck on 18/01/2017.
//  Copyright © 2017 Kevin De Koninck. All rights reserved.
//

import Foundation

let globalTempFilesPath     = "/tmp/"
let userCachePath           = "~/Library/Caches/"
let userLogsPath            = "~/Library/logs/"
let userPreferencesPath     = "~/Library/Preferences/"
let systemLogs1Path         = "/Library/logs/"
let systemLogs2Path         = "/var/log/"
let mailAttachementsPath    = "~/Library/Containers/com.apple.mail/Data/Library/Mail\\ Downloads/"
let trashPath               = "~/.Trash/"
let xcodeDerivedDataPath    = "~/Library/Developer/Xcode/DerivedData/"
let xcodeArchivesPath       = "~/Library/Developer/Xcode/Archives/"
let xcodeDeviceLogsPath     = "~/Library/Developer/Xcode/iOS\\ Device\\ Logs/"
let terminalCacheFilesPath  = "/private/var/log/asl/*.asl"
let terminalCachePath       = "/private/var/log/asl/" // used for open func
let bashHistoryFile         = "~/.bash_history"
let bashHistoryPath         = "~/.bash_sessions/"
let downloadsPath           = "~/Downloads/"
let userAppLogsPath         = "~/Library/Containers/*/Data/Library/Logs/"
let userAppCachePath        = "~/Library/Containers/*/Data/Library/Caches/"
let spotlightPath           = "/.Spotlight-V100/"
let docRevPath              = "/.DocumentRevisions-V100/"
let imessageAttachmentsPath = "~/Library/Messages/Attachments/"
//Folder for symbolic links this app creates
let symbolicUserAppLogsPath = "~/.AppLogsSymLinksForCleanMe/"
let symbolicUserAppCachePath = "~/.AppCacheSymLinksForCleanMe/"

let PATH : [String: String] = [ "trash"         : trashPath,
                                "mails"         : mailAttachementsPath,
                                "xcode"         :   /* xcodeArchivesPath + " " + */ xcodeDeviceLogsPath + " " + xcodeDerivedDataPath,
                                "bash"          : bashHistoryPath + " " + bashHistoryFile,
                                "terminal"      : terminalCacheFilesPath,
                                "userAppLogs"   : userAppLogsPath,
                                "userAppCache"  : userAppCachePath,
                                "userCache"     : userCachePath,
                                "userLogs"      : userLogsPath,
                                "systemLogs"    : systemLogs1Path + " " + systemLogs2Path,
                                "globalTemp"    : globalTempFilesPath,
                                "userPrefs"     : userPreferencesPath,
                                "downloads"     : downloadsPath,
                                "spotlight"     : spotlightPath,
                                "docRev"        : docRevPath,
                                "imessage"      : imessageAttachmentsPath
                              ]
let PATHkey: [String] = ["trash","mails","xcode","bash","terminal","userAppLogs","userAppCache", "userCache","userLogs","systemLogs","globalTemp","userPrefs","downloads","spotlight","docRev", "imessage"] //helper
