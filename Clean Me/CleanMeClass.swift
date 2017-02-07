//
//  CleanMeClass.swift
//  Clean Me
//
//  Created by Kevin De Koninck on 21/01/2017.
//  Copyright © 2017 Kevin De Koninck. All rights reserved.
//

import Foundation
import STPrivilegedTask

class CleanMe {
    
    var sizesMB : [String: String] = [  PATHkey[0]: "",
                                        PATHkey[1]: "",
                                        PATHkey[2]: "",
                                        PATHkey[3]: "",
                                        PATHkey[4]: "",
                                        PATHkey[5]: "",
                                        PATHkey[6]: "",
                                        PATHkey[7]: "",
                                        PATHkey[8]: "",
                                        PATHkey[9]: "",
                                        PATHkey[10]: "",
                                        PATHkey[11]: "",
                                        PATHkey[12]: "",
                                        PATHkey[13]: "",
                                        PATHkey[14]: "",
                                        PATHkey[15]: "",
                                        "TOTAL": ""
                                    ]
    
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------

    
    func openInFinder(Path: String){
        switch Path {
        case "terminal":     _ = self.execute(command: "open " + terminalCachePath)
        case "userAppLogs":  _ = self.execute(command: "open " + symbolicUserAppLogsPath)
        case "userAppCache": _ = self.execute(command: "open " + symbolicUserAppCachePath)
        default:             _ = self.execute(command: "open " + PATH[Path]!)
        }
    }
    
    //--------------------------------------------------------------------------

    
    func deleteItems(checkedItemsArray: [Int]){
        var asRoot = false
        var cmd = ""
        
        //Create command
        for pathKey in checkedItemsArray{
            cmd = cmd + createDeleteCmd(path: PATH[PATHkey[pathKey]]!) + " && "

            //Check if we need to execute it as root
            if(pathKey == 11 || pathKey == 10 || pathKey == 9 || pathKey == 4 || pathKey == 14 || pathKey == 15){
                asRoot = true
            }
        }
        
        //Remove last " && "
        cmd = cmd.substring(to: cmd.index(cmd.endIndex, offsetBy: -3))

        _ = self.execute(command: cmd, asRoot: asRoot)
    }
    
    
    private func createDeleteCmd(path: String) -> String{
            return "rm -rf " + path + " 2>/dev/null "
    }
    
    
    //--------------------------------------------------------------------------
    
    func getSizeOfUsedDiskSpaceInMB() -> String {
        return(execute(command: "df -m / | egrep '/$' | awk '{print $4}' | cut -f 1"))
    }

    func calculateSizes() {
        
        //Create command
        var cmd = ""
        for (index, _) in PATHkey.enumerated(){
            cmd = cmd + createSizeCmd(path: PATH[PATHkey[index]]!) + " && "
        }
        
        //Remove last "&&"
        cmd = cmd.substring(to: cmd.index(cmd.endIndex, offsetBy: -3))
        
        //Execute command
        let resultStr = self.execute(command: cmd, asRoot: true)

        //Postprocess result of command
        var resultArr = resultStr.components(separatedBy: "\n")
        if(resultArr.last == "" || resultArr.last == " ") { _ = resultArr.popLast() }
        
        for (index, _) in PATHkey.enumerated(){
                self.sizesMB[PATHkey[index]] = resultArr[index]
        }

        //Calculate total size
        var totalSize = 0
        for sizeStr in resultArr{
            totalSize = totalSize + Int(sizeStr)!
        }
        self.sizesMB["TOTAL"] = "\(totalSize)"
    }
    
    private func createSizeCmd(path: String) -> String {
        return "du -smc " + path + " 2>/dev/null | sed -n '$s/\t.*//p'"
    }
    
    //--------------------------------------------------------------------------
    
    func execute(command: String, asRoot: Bool = false) -> String {
        if(asRoot){
            return self.executeAsRoot(command: command)
        } else {
            return self.execute(command: command)
        }
    }
    
    private func execute(command: String) -> String {
        var arguments:[String] = []
        arguments.append("-c")
        arguments.append( command )
        
        let task = Process()
        task.launchPath = "/bin/sh"
        task.arguments = arguments
        
        let pipe = Pipe()
        task.standardOutput = pipe
        task.standardError = pipe
        task.launch()
        task.waitUntilExit()
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        
        return(NSString(data: data, encoding: String.Encoding.utf8.rawValue) as! String)
    }
    
    private func executeAsRoot(command: String) -> String {
        var returnVal = ""
        var arguments:[String] = []
        arguments.append("-c")
        arguments.append( command )
        
        let task = STPrivilegedTask()
        task.setLaunchPath("/bin/sh")
        task.setArguments(arguments)
        
        let err: OSStatus = task.launch()
        if (err != errAuthorizationSuccess) {
            if (err == errAuthorizationCanceled) {
                //User cancelled
                return(self.execute(command: command))
            } else {
                //something went wrong
                return(self.execute(command: command))
            }
        } else {
            //Task successfully launched
            task.waitUntilExit()
            let data = task.outputFileHandle().readDataToEndOfFile()
            returnVal = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as! String
        }
        return returnVal
    }
    
}
