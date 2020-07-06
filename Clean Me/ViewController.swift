//
//  ViewController.swift
//  Clean Me
//
//  Created by Kevin De Koninck on 17/01/2017.
//  Copyright © 2017 Kevin De Koninck. All rights reserved.
//

import Cocoa
import STPrivilegedTask
import ITSwitch

class ViewController: NSViewController {
    let blueColor = NSColor.init(red: 45.0/255, green: 135.0/255, blue: 250.0/255, alpha: 0.7)
    
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
    @IBOutlet weak var systemLogsSize: NSTextField!
    @IBOutlet weak var UserPreferencesSize: NSTextField!
    @IBOutlet weak var globalTempSize: NSTextField!
    @IBOutlet weak var totalSize: NSTextField!
    @IBOutlet weak var totalText: NSTextField!
    @IBOutlet weak var downloadsFolderSize: NSTextField!
    @IBOutlet weak var spotlightSize: NSTextField!
    @IBOutlet weak var docRevSize: NSTextField!
    @IBOutlet weak var imessageAttachementsSize: NSTextField!
    @IBOutlet weak var totalSelectedText: NSTextField!
    @IBOutlet weak var totalSelectedSize: NSTextField!
    
    
    @IBOutlet weak var EmptyTrashSwitch: ITSwitch!
    @IBOutlet weak var downloadedMailAttachementsSwitch: ITSwitch!
    @IBOutlet weak var xcodeSwitch: ITSwitch!
    @IBOutlet weak var bashHistorySwitch: ITSwitch!
    @IBOutlet weak var terminalCacheSwitch: ITSwitch!
    @IBOutlet weak var userApplicationLogsSwitch: ITSwitch!
    @IBOutlet weak var userApplicationCacheSwitch: ITSwitch!
    @IBOutlet weak var UserCacheSwitch: ITSwitch!
    @IBOutlet weak var userLogsSwitch: ITSwitch!
    @IBOutlet weak var systemLogsSwitch: ITSwitch!
    @IBOutlet weak var UserPreferencesSwitch: ITSwitch!
    @IBOutlet weak var globalTempSwitch: ITSwitch!
    @IBOutlet weak var downloadsFolderSwitch: ITSwitch!
    @IBOutlet weak var spotlightSwitch: ITSwitch!
    @IBOutlet weak var docRevSwitch: ITSwitch!
    @IBOutlet weak var imessageAttachmentsSwitch: ITSwitch!
    
    @IBOutlet weak var analyseBtn: BlueButton!
    @IBOutlet weak var cleanBtn: GrayButton!
    
    @IBOutlet weak var progressView: ProgressView!
    @IBOutlet weak var progressTitle: NSTextField!
    @IBOutlet weak var progressDetails: NSTextField!
    
    @IBOutlet weak var advancedOptionsSwitch: ITSwitch!
    
    //MARK: DEFENITIONS
    var cleanMe = CleanMe()
    
    //MARK: APPLICATION FUNCTIONS
    override func viewDidLoad() {
    
        EmptyTrashSwitch.checked = true
        downloadedMailAttachementsSwitch.checked = true
        downloadsFolderSwitch.checked = true
        xcodeSwitch.checked = true
        
        advancedOptionsSwitch.checked = false
        
        EmptyTrashSwitch.tintColor = blueColor
        downloadedMailAttachementsSwitch.tintColor = blueColor
        xcodeSwitch.tintColor = blueColor
        bashHistorySwitch.tintColor = blueColor
        terminalCacheSwitch.tintColor = blueColor
        userApplicationLogsSwitch.tintColor = blueColor
        userApplicationCacheSwitch.tintColor = blueColor
        UserCacheSwitch.tintColor = blueColor
        userLogsSwitch.tintColor = blueColor
        systemLogsSwitch.tintColor = blueColor
        UserPreferencesSwitch.tintColor = blueColor
        globalTempSwitch.tintColor = blueColor
        downloadsFolderSwitch.tintColor = blueColor
        spotlightSwitch.tintColor = blueColor
        docRevSwitch.tintColor = blueColor
        imessageAttachmentsSwitch.tintColor = blueColor
        advancedOptionsSwitch.tintColor = blueColor
        
        totalSelectedSize.isHidden = true
        totalSelectedText.isHidden = true
        
        clearSizes()
        setToolTips()
        
        createAndUpdateSymbolicLinks()
        
        dismissProgressIndicator()
        
        enableAdvancedOptions(enabled: false)
    }
    
    override func awakeFromNib() {
        if self.view.layer != nil {
            var color : CGColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            if(InterfaceStyle().rawValue == "Dark"){
                color = CGColor(red: 42/255.0, green: 41/255.0, blue: 41/255.0, alpha: 1.0)
            }
            self.view.layer?.backgroundColor = color
        }
    }
    
    override func viewWillDisappear() {
        removeSymbolicLinks()
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
        systemLogsSize.stringValue = ""
        UserPreferencesSize.stringValue = ""
        globalTempSize.stringValue = ""
        totalSize.stringValue = ""
        totalText.stringValue = ""
        downloadsFolderSize.stringValue = ""
        spotlightSize.stringValue = ""
        docRevSize.stringValue = ""
        imessageAttachementsSize.stringValue = ""
        totalSelectedText.stringValue = ""
        totalSelectedSize.stringValue = ""
    }
    
    func enableAdvancedOptions (enabled: Bool){
        bashHistorySwitch.isEnabled = enabled
        terminalCacheSwitch.isEnabled = enabled
        userApplicationLogsSwitch.isEnabled = enabled
        userApplicationCacheSwitch.isEnabled = enabled
        UserCacheSwitch.isEnabled = enabled
        userLogsSwitch.isEnabled = enabled
        systemLogsSwitch.isEnabled = enabled
        UserPreferencesSwitch.isEnabled = enabled
        globalTempSwitch.isEnabled = enabled
        spotlightSwitch.isEnabled = enabled
        imessageAttachmentsSwitch.isEnabled = enabled
    }
    
    func setAdvancedOptions (checked: Bool){
        bashHistorySwitch.checked = checked
        terminalCacheSwitch.checked = checked
        userApplicationLogsSwitch.checked = checked
        userApplicationCacheSwitch.checked = checked
        UserCacheSwitch.checked = checked
        userLogsSwitch.checked = checked
        systemLogsSwitch.checked = checked
        UserPreferencesSwitch.checked = checked
        globalTempSwitch.checked = checked
        spotlightSwitch.checked = checked
        imessageAttachmentsSwitch.checked = checked
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
        systemLogsSwitch.toolTip = systemLogsToolTip
        UserPreferencesSwitch.toolTip = userPrefsToolTip
        globalTempSwitch.toolTip = globalTempToolTip
        downloadsFolderSwitch.toolTip = downloadsToolTip
        spotlightSwitch.toolTip = spotlightTooltip
        docRevSwitch.toolTip = docRevTooltip
        imessageAttachmentsSwitch.toolTip = imessageAttachmentTooltip
    }
    
    func createAndUpdateSymbolicLinks(){
        
        removeSymbolicLinks()
        
        //create temp folders for symbolic links to app cache and app logs
        _ = cleanMe.execute(command: "mkdir " + symbolicUserAppLogsPath + " " + symbolicUserAppCachePath, asRoot: false)
        
        //Create symbolic links
        _ = cleanMe.execute(command: "for x in $(ls ~/Library/Containers/); do [ -d ~/Library/Containers/$x/Data/Library/Logs/ ] && ln -s ~/Library/Containers/$x/Data/Library/Logs/ " + symbolicUserAppLogsPath + "$x; done;", asRoot: false)
        _ = cleanMe.execute(command: "for x in $(ls ~/Library/Containers/); do [ -d ~/Library/Containers/$x/Data/Library/Caches/ ] && ln -s ~/Library/Containers/$x/Data/Library/Caches/ " + symbolicUserAppCachePath + "$x; done;", asRoot: false)
    }
    
    func removeSymbolicLinks(){
        _ = cleanMe.execute(command: "rm -rf " + symbolicUserAppLogsPath + " " + symbolicUserAppCachePath, asRoot: false)
    }
    
    func enableAll(enabled: Bool){
        EmptyTrashSwitch.isEnabled = enabled
        downloadedMailAttachementsSwitch.isEnabled = enabled
        xcodeSwitch.isEnabled = enabled
        bashHistorySwitch.isEnabled = enabled
        terminalCacheSwitch.isEnabled = enabled
        userApplicationLogsSwitch.isEnabled = enabled
        userApplicationCacheSwitch.isEnabled = enabled
        UserCacheSwitch.isEnabled = enabled
        userLogsSwitch.isEnabled = enabled
        systemLogsSwitch.isEnabled = enabled
        UserPreferencesSwitch.isEnabled = enabled
        globalTempSwitch.isEnabled = enabled
        downloadsFolderSwitch.isEnabled = enabled
        spotlightSwitch.isEnabled = enabled
        docRevSwitch.isEnabled = enabled
        imessageAttachmentsSwitch.isEnabled = enabled
        
        analyseBtn.isEnabled = enabled
        cleanBtn.isEnabled = enabled
    }
    
    func showProgressIndicator(title: String, details: String) {
        self.enableAll(enabled: false)
        progressTitle.stringValue = title
        progressDetails.stringValue = details
        progressView.isHidden = false
        progressTitle.isHidden = false
        progressDetails.isHidden = false
    }
    
    func dismissProgressIndicator() {
        self.enableAll(enabled: true)
        progressView.isHidden = true
        progressTitle.isHidden = true
        progressDetails.isHidden = true
    }
    
    
    //MARK: POPUPS

    func showOKPopUp(title: String, text: String) {
        let myPopup: NSAlert = NSAlert()
        myPopup.messageText = title
        myPopup.informativeText = text
        myPopup.alertStyle = NSAlert.Style.warning
        myPopup.addButton(withTitle: "OK")
        myPopup.runModal()

    }
    
    func popUpOKCancel(question: String, text: String, firstBtn: String, secondBtn: String) -> Bool {
        let myPopup: NSAlert = NSAlert()
        myPopup.messageText = question
        myPopup.informativeText = text
        myPopup.alertStyle = NSAlert.Style.critical
        myPopup.addButton(withTitle: firstBtn)
        myPopup.addButton(withTitle: secondBtn)
        return myPopup.runModal() == NSApplication.ModalResponse.alertFirstButtonReturn
    }
    
    @IBAction func switchToggled(_ sender: ITSwitch) {
        updateSelectedSize()
    }
    
    func updateSelectedSize() {
        var selectedSize: Double = 0
        if(EmptyTrashSwitch.checked){ selectedSize = selectedSize + (Double(cleanMe.sizesMB["trash"]!) ?? 0.0) }
        if(downloadedMailAttachementsSwitch.checked){ selectedSize = selectedSize + (Double(cleanMe.sizesMB["mails"]!) ?? 0.0) }
        if(xcodeSwitch.checked){ selectedSize = selectedSize + (Double(cleanMe.sizesMB["xcode"]!) ?? 0.0) }
        if(bashHistorySwitch.checked){ selectedSize = selectedSize + (Double(cleanMe.sizesMB["bash"]!) ?? 0.0) }
        if(terminalCacheSwitch.checked){ selectedSize = selectedSize + (Double(cleanMe.sizesMB["terminal"]!) ?? 0.0) }
        if(userApplicationLogsSwitch.checked){ selectedSize = selectedSize + (Double(cleanMe.sizesMB["userAppLogs"]!) ?? 0.0) }
        if(userApplicationCacheSwitch.checked){ selectedSize = selectedSize + (Double(cleanMe.sizesMB["userAppCache"]!) ?? 0.0) }
        if(UserCacheSwitch.checked){ selectedSize = selectedSize + (Double(cleanMe.sizesMB["userCache"]!) ?? 0.0) }
        if(userLogsSwitch.checked){ selectedSize = selectedSize + (Double(cleanMe.sizesMB["userLogs"]!) ?? 0.0) }
        if(systemLogsSwitch.checked){ selectedSize = selectedSize + (Double(cleanMe.sizesMB["systemLogs"]!) ?? 0.0) }
        if(globalTempSwitch.checked){ selectedSize = selectedSize + (Double(cleanMe.sizesMB["globalTemp"]!) ?? 0.0) }
        if(UserPreferencesSwitch.checked){ selectedSize = selectedSize + (Double(cleanMe.sizesMB["userPrefs"]!) ?? 0.0) }
        if(downloadsFolderSwitch.checked){ selectedSize = selectedSize + (Double(cleanMe.sizesMB["downloads"]!) ?? 0.0) }
        if(spotlightSwitch.checked){ selectedSize = selectedSize + (Double(cleanMe.sizesMB["spotlight"]!) ?? 0.0) }
        if(docRevSwitch.checked){ selectedSize = selectedSize + (Double(cleanMe.sizesMB["docRev"]!) ?? 0.0) }
        if(imessageAttachmentsSwitch.checked){ selectedSize = selectedSize + (Double(cleanMe.sizesMB["imessage"]!) ?? 0.0) }
        
        totalSelectedText.stringValue = "TOTAL SELECTED"
        totalSelectedSize.stringValue = processSize(sizeInMB: String(selectedSize))
    }
    
    
    //MARK: ACTIONS
    @IBAction func openBtnClicked(_ sender: NSButton) {
        cleanMe.openInFinder(Path: PATHkey[sender.tag])
    }

    @IBAction func cleanBtnClicked(_ sender: Any) {
        defer {
            createAndUpdateSymbolicLinks() //Recreate symbolic links for app chache and logs
        }
        
        // Check all switches
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
        if(systemLogsSwitch.checked){ PathKeys.append(10) }
        if(globalTempSwitch.checked){ PathKeys.append(11) }
        if(UserPreferencesSwitch.checked){ PathKeys.append(12) }
        if(downloadsFolderSwitch.checked){ PathKeys.append(13) }
        if(spotlightSwitch.checked){ PathKeys.append(14) }
        if(docRevSwitch.checked){ PathKeys.append(15) }
        if(imessageAttachmentsSwitch.checked){ PathKeys.append(16) }
        
        // Check for empty array (see GitHub Issue #4)
        if(PathKeys.count == 0){
            showProgressIndicator(title: "Eurgh...", details: "")
            showOKPopUp(title: "Whoops...", text: "You didn't select anything...")
            return
        }
        
        // Check if a user wants to continue
        if(popUpOKCancel(question: "CAUTION", text: "Are you sure you want to continue?\n\nClean Me uses the command 'rm -rf folder_name/*' to clean out your system. With this, there is no undo button (files will be deleted immediately instead of going to the Trash). Your Mac may become unresponsive or completely useless. Please, know what you are doing...", firstBtn: "Cancel", secondBtn: "I understand")){
            return
        }
        
        showProgressIndicator(title: "Cleaning...", details: "")
        
        clearSizes()
        
        let diskSizeBeforeInMB = Int(cleanMe.getSizeOfUsedDiskSpaceInMB().replacingOccurrences(of: "\n", with: ""))!

        // Do the cleaning
        cleanMe.deleteItems(checkedItemsArray: PathKeys)
    
    
        // Display results
        showProgressIndicator(title: "Finishing!", details: "")
        var sizeCleanedInMB = Int(cleanMe.getSizeOfUsedDiskSpaceInMB().replacingOccurrences(of: "\n", with: ""))! - diskSizeBeforeInMB
        let sizeCleanedInGB = Double(round(Double(sizeCleanedInMB) / 1024.0 * 100)/100)
        
        if(sizeCleanedInMB < 0) { sizeCleanedInMB = 0 }
        var popUpText = ""
        if (sizeCleanedInMB  < 1025){
            popUpText = "\(sizeCleanedInMB) MB"
        } else {
            popUpText = "\(sizeCleanedInMB) MB (roughly \(sizeCleanedInGB) GB)"
        }
        showOKPopUp(title: "Success!", text: "Total of " + popUpText + " cleaned.")
        dismissProgressIndicator()
    }
    
    @IBAction func AnalyzeBtnClicked(_ sender: NSButton) {
        showProgressIndicator(title: "Analyzing...", details: "")
        defer {
            dismissProgressIndicator()
        }
        
        clearSizes()
        cleanMe.calculateSizes()
        
        EmptyTrashSize.stringValue = processSize(sizeInMB: cleanMe.sizesMB["trash"]!)
        downloadedMailAttachementsSize.stringValue = processSize(sizeInMB: cleanMe.sizesMB["mails"]!)
        xcodeSize.stringValue = processSize(sizeInMB: cleanMe.sizesMB["xcode"]!)
        bashHistorySize.stringValue = processSize(sizeInMB: cleanMe.sizesMB["bash"]!)
        terminalCacheSize.stringValue = processSize(sizeInMB: cleanMe.sizesMB["terminal"]!)
        userApplicationLogsSize.stringValue =  processSize(sizeInMB: cleanMe.sizesMB["userAppLogs"]!)
        userApplicationCacheSize.stringValue = processSize(sizeInMB: cleanMe.sizesMB["userAppCache"]!)
        UserCacheSize.stringValue = processSize(sizeInMB: cleanMe.sizesMB["userCache"]!)
        userLogsSize.stringValue = processSize(sizeInMB: cleanMe.sizesMB["userLogs"]!)
        systemLogsSize.stringValue = processSize(sizeInMB: cleanMe.sizesMB["systemLogs"]!)
        UserPreferencesSize.stringValue = processSize(sizeInMB: cleanMe.sizesMB["userPrefs"]!)
        globalTempSize.stringValue = processSize(sizeInMB: cleanMe.sizesMB["globalTemp"]!)
        downloadsFolderSize.stringValue = processSize(sizeInMB: cleanMe.sizesMB["downloads"]!)
        spotlightSize.stringValue = processSize(sizeInMB: cleanMe.sizesMB["spotlight"]!)
        docRevSize.stringValue = processSize(sizeInMB: cleanMe.sizesMB["docRev"]!)
        imessageAttachementsSize.stringValue = processSize(sizeInMB: cleanMe.sizesMB["imessage"]!)
        
        totalText.stringValue = "TOTAL:"
        
        totalSize.stringValue = processSize(sizeInMB: cleanMe.sizesMB["TOTAL"]!)
        
        // enable total selected size strings
        updateSelectedSize()
        totalSelectedSize.isHidden = false
        totalSelectedText.isHidden = false
    }
    
    func convertMBtoGBAndRoundTo2DigitsAfterComma(sizeInMB: String) -> Double {
        return Double(round(Double(sizeInMB)!/1024.0 * 100)/100)
    }
    
    func processSize(sizeInMB: String) -> String {
        if(Double(sizeInMB)! > 1024){
            return "\(convertMBtoGBAndRoundTo2DigitsAfterComma(sizeInMB: sizeInMB)) GB"
        } else {
            return "\(sizeInMB) MB"
        }
    }
    
    @IBAction func enableAdvancedOptionsClicked(_ sender: Any) {
        if(advancedOptionsSwitch.checked){
            // Check if a user wants to continue
            if(popUpOKCancel(question: "CAUTION", text: "Are you sure you want to enable advanced options?\n\nClean Me uses the command 'rm -rf folder_name/*' to clean out your system. With this, there is no undo button. Your Mac may become unresponsive or completely useless if you remove crucial files. Please, know what you are doing when enabling advanced options.", firstBtn: "Cancel", secondBtn: "I understand")){
                advancedOptionsSwitch.checked = false;
                return
            }
        } else {
            setAdvancedOptions(checked: false)
        }
        enableAdvancedOptions(enabled: advancedOptionsSwitch.checked)
        updateSelectedSize()
    }
    
}
