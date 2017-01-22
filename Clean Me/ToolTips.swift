//
//  ToolTips.swift
//  Clean Me
//
//  Created by Kevin De Koninck on 18/01/2017.
//  Copyright © 2017 Kevin De Koninck. All rights reserved.
//

import Foundation

let trashToolTip = "Deletes all files and folders in your Trash."

let mailsToolTip = "Deletes downloaded attachements of Apple Mail.\nApple Mail automatically saves all your attachements in a folder deep within your user library, sucking up disk space."

let xcodeToolTip = "Cleans out all unnecessary files from Xcode (archives, device logs, ...)."

let bashToolTip = "Deletes your bash history and bash sessions (Terminal)"

let terminalToolTip = "Deletes all the *.asl log files.\nThis may be usefull if your Terminal is running slow."

let userAppLogsTooltip = "Deletes all log files created by applications owned by the user.\n\nIf you do not need them, delete them. But be aware, if something is wrong, processes can have a large size (large size = problem)."

let userAppCacheToolTip = "Deletes all cache created by applications owned by the user.\n\nApplication cache is used by both native and third-party applications to store temporary information (like a recently visited webpage) and speed up load times.\nIn general, caching is a good thing. It makes applications faster. But sometimes a problem with a piece of cached information or a software bug can cause applications to load slowly or even crash."

let userCacheToolTip = "Deletes all cache created by nearly all applications that are actively used in macOS. \n\nWhile most apps maintain their caches reasonably well and don’t let things get out of control, some aren’t so good at it, and some apps leave behind rather large folders that serve no purpose if you no longer use the application."

let userLogsToolTip = "Deletes all log files created by the user.\n\nIf you do not need them, delete them. But be aware, if something is wrong, processes can have a large size (large size = problem)."

let systemCacheToolTip = "Deletes all cache created by the system.\n\nThe system cache actually speeds up your Mac. You don't need to clear the cache unless your Mac is suddenly acting odd, or it has slowed down. These might indicate that the cache has become corrupted.\nClearing the system cache won't hurt anything. At first, until a new cache is created, functions that had been cached will be slower. But that will be very temporary."


let systemLogsToolTip = "Deletes all log files created by the system.\n\nIf you do not need them, delete them. But be aware, if something is wrong, processes can have a large size (large size = problem)."

let globalTempToolTip = "Deletes all global temporary files."

let userPrefsToolTip = "Deletes all custom preferences used in apps and the system.\n\nThe Preferences file contains the information an application needs to keep track of your customized settings\nNOT recommended."

let downloadsToolTip = "Deletes everything from your Downloads folder."
