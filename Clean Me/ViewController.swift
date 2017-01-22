//
//  ViewController.swift
//  Clean Me
//
//  Created by Kevin De Koninck on 17/01/2017.
//  Copyright © 2017 Kevin De Koninck. All rights reserved.
//

import Cocoa
import DJProgressHUD_OSX
import STPrivilegedTask
import ITSwitch

class ViewController: NSViewController {
    
    //MARK: OUTLETS
    @IBOutlet weak var EmptyTrashSize: NSTextField!
    @IBOutlet weak var downloadedMailAttachementsSize: NSTextField!
    @IBOutlet weak var xcodeSize: NSTextField!
    @IBOutlet weak var bashHistorySize: NSTextField!
    @IBOutlet weak var terminalCacheSize: NSTextField!
    @IBOutlet weak var userApplicationLogsSize: NSTextField!
    @IBOutlet weak var userApplicationCacheSize: NSTextField!
    @IBOutlet weak var UserCacheSize: NSTextField!
    @IBOutlet weak var userLogsSize: NSTextField!
    @IBOutlet weak var systemCacheSize: NSTextField!
    @IBOutlet weak var systemLogsSize: NSTextField!
    @IBOutlet weak var UserPreferencesSize: NSTextField!
    @IBOutlet weak var globalTempSize: NSTextField!
    @IBOutlet weak var totalSize: NSTextField!
    @IBOutlet weak var totalText: NSTextField!
    @IBOutlet weak var downloadsFolderSize: NSTextField!
    
    
    
    @IBOutlet weak var EmptyTrashSwitch: ITSwitch!
    @IBOutlet weak var downloadedMailAttachementsSwitch: ITSwitch!
    @IBOutlet weak var xcodeSwitch: ITSwitch!
    @IBOutlet weak var bashHistorySwitch: ITSwitch!
    @IBOutlet weak var terminalCacheSwitch: ITSwitch!
    @IBOutlet weak var userApplicationLogsSwitch: ITSwitch!
    @IBOutlet weak var userApplicationCacheSwitch: ITSwitch!
    @IBOutlet weak var UserCacheSwitch: ITSwitch!
    @IBOutlet weak var userLogsSwitch: ITSwitch!
    @IBOutlet weak var systemCacheSwitch: ITSwitch!
    @IBOutlet weak var systemLogsSwitch: ITSwitch!
    @IBOutlet weak var UserPreferencesSwitch: ITSwitch!
    @IBOutlet weak var globalTempSwitch: ITSwitch!
    @IBOutlet weak var downloadsFolderSwitch: ITSwitch!
    
    
    //MARK: DEFENITIONS
    var cleanMe = CleanMe()
    
    //MARK: APPLICATION FUNCTIONS
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearSizes()
        EmptyTrashSwitch.checked = true
        downloadedMailAttachementsSwitch.checked = true
        bashHistorySwitch.checked = true
        userApplicationLogsSwitch.checked = true
        userLogsSwitch.checked = true
        
        setToolTips()
    }
    
    override func awakeFromNib() {
        if self.view.layer != nil {
            let color : CGColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.view.layer?.backgroundColor = color
        }
    }
    
    func clearSizes(){
        EmptyTrashSize.stringValue = ""
        downloadedMailAttachementsSize.stringValue = ""
        xcodeSize.stringValue = ""
        bashHistorySize.stringValue = ""
        terminalCacheSize.stringValue = ""
        userApplicationLogsSize.stringValue = ""
        userApplicationCacheSize.stringValue = ""
        UserCacheSize.stringValue = ""
        userLogsSize.stringValue = ""
        systemCacheSize.stringValue = ""
        systemLogsSize.stringValue = ""
        UserPreferencesSize.stringValue = ""
        globalTempSize.stringValue = ""
        totalSize.stringValue = ""
        totalText.stringValue = ""
        downloadsFolderSize.stringValue = ""
    }
    
    func setToolTips(){
        EmptyTrashSwitch.toolTip = trashToolTip
        downloadedMailAttachementsSwitch.toolTip = mailsToolTip
        xcodeSwitch.toolTip = xcodeToolTip
        bashHistorySwitch.toolTip = bashToolTip
        terminalCacheSwitch.toolTip = terminalToolTip
        userApplicationLogsSwitch.toolTip = userAppLogsTooltip
        userApplicationCacheSwitch.toolTip = userAppCacheToolTip
        UserCacheSwitch.toolTip = userCacheToolTip
        userLogsSwitch.toolTip = userAppLogsTooltip
        systemCacheSwitch.toolTip = systemCacheToolTip
        systemLogsSwitch.toolTip = systemLogsToolTip
        UserPreferencesSwitch.toolTip = userPrefsToolTip
        globalTempSwitch.toolTip = globalTempToolTip
        downloadsFolderSwitch.toolTip = downloadsToolTip
    }
    
    
    
    //MARK: OTHER FUNCTIONS
    func showSpaceCleanedPopUp(spaceCleaned: String) {
        let myPopup: NSAlert = NSAlert()
        myPopup.messageText = "Success!"
        myPopup.informativeText = "Total of " + spaceCleaned + " cleaned."
        myPopup.alertStyle = NSAlertStyle.warning
        myPopup.addButton(withTitle: "OK")
        myPopup.runModal()
    }
    

    
    //MARK: ACTIONS
    @IBAction func openBtnClicked(_ sender: NSButton) {
        cleanMe.openInFinder(Path: PATHkey[sender.tag])
    }

    @IBAction func cleanBtnClicked(_ sender: Any) {
        DJProgressHUD.showStatus("Cleaning", from: self.view)
        
        clearSizes()

        let diskSizeBeforeInMB = Int(cleanMe.getSizeOfUsedDiskSpaceInMB().replacingOccurrences(of: "\n", with: ""))!
        let diskSizeBeforeInGB = Int(cleanMe.getSizeOfUsedDiskSpaceInGB().replacingOccurrences(of: "\n", with: ""))!
        
        // Do the cleaning
        
        var PathKeys = [Int]()
        
        if(EmptyTrashSwitch.checked){ PathKeys.append(0) }
        if(downloadedMailAttachementsSwitch.checked){ PathKeys.append(1) }
        if(xcodeSwitch.checked){ PathKeys.append(2) }
        if(bashHistorySwitch.checked){ PathKeys.append(3) }
        if(terminalCacheSwitch.checked){ PathKeys.append(4) }
        if(userApplicationLogsSwitch.checked){ PathKeys.append(5) }
        if(userApplicationCacheSwitch.checked){ PathKeys.append(6) }
        if(UserCacheSwitch.checked){ PathKeys.append(7) }
        if(userLogsSwitch.checked){ PathKeys.append(8) }
        if(systemCacheSwitch.checked){ PathKeys.append(9) }
        if(systemLogsSwitch.checked){ PathKeys.append(10) }
        if(globalTempSwitch.checked){ PathKeys.append(11) }
        if(UserPreferencesSwitch.checked){ PathKeys.append(12) }
        if(downloadsFolderSwitch.checked){ PathKeys.append(13) }
        
        cleanMe.deleteItems(checkedItemsArray: PathKeys)
        
        // Display results
        
        DJProgressHUD.showStatus("Finishing", from: self.view)
        var sizeCleanedInMB = Int(cleanMe.getSizeOfUsedDiskSpaceInMB().replacingOccurrences(of: "\n", with: ""))! - diskSizeBeforeInMB
        let sizeCleanedInGB = Int(cleanMe.getSizeOfUsedDiskSpaceInGB().replacingOccurrences(of: "\n", with: ""))! - diskSizeBeforeInGB
        if(sizeCleanedInMB < 0) { sizeCleanedInMB = 0 }
        var popUpText = ""
        if (sizeCleanedInGB  == 0){
            popUpText = "\(sizeCleanedInMB) MB"
        } else {
            popUpText = "\(sizeCleanedInMB) MB (roughly \(sizeCleanedInGB) GB)"
        }
        showSpaceCleanedPopUp(spaceCleaned: popUpText)
        DJProgressHUD.dismiss()
    }
    
    @IBAction func AnalyzeBtnClicked(_ sender: NSButton) {
        DJProgressHUD.showStatus("Analyzing", from: self.view)
        
        clearSizes()
        cleanMe.calculateSizes()
        
        EmptyTrashSize.stringValue = cleanMe.sizesMB["trash"]! + " MB"
        downloadedMailAttachementsSize.stringValue = cleanMe.sizesMB["mails"]! + " MB"
        xcodeSize.stringValue = cleanMe.sizesMB["xcode"]! + " MB"
        bashHistorySize.stringValue = cleanMe.sizesMB["bash"]! + " MB"
        terminalCacheSize.stringValue = cleanMe.sizesMB["terminal"]! + " MB"
        userApplicationLogsSize.stringValue = cleanMe.sizesMB["userAppLogs"]! + " MB"
        userApplicationCacheSize.stringValue = cleanMe.sizesMB["userAppCache"]! + " MB"
        UserCacheSize.stringValue = cleanMe.sizesMB["userCache"]! + " MB"
        userLogsSize.stringValue = cleanMe.sizesMB["userLogs"]! + " MB"
        systemCacheSize.stringValue = cleanMe.sizesMB["systemCache"]! + " MB"
        systemLogsSize.stringValue = cleanMe.sizesMB["systemLogs"]! + " MB"
        UserPreferencesSize.stringValue = cleanMe.sizesMB["userPrefs"]! + " MB"
        globalTempSize.stringValue = cleanMe.sizesMB["globalTemp"]! + " MB"
        downloadsFolderSize.stringValue = cleanMe.sizesMB["downloads"]! + " MB"
        
        totalText.stringValue = "TOTAL:"
        
        if(Int(cleanMe.sizesMB["TOTAL"]!)! > 1024) {
            let totalSizeInt = Double(cleanMe.sizesMB["TOTAL"]!)!
            
            totalSize.stringValue = "\(Double(round(totalSizeInt / 1024.0 * 100)/100)) GB"
        } else {
            totalSize.stringValue = cleanMe.sizesMB["TOTAL"]! + " MB"
        }

        DJProgressHUD.dismiss()
    }
 
}
