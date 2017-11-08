//
//  Request+Notify.swift
//  Kryptonite
//
//  Created by Alex Grinman on 6/23/17.
//  Copyright © 2017 KryptCo. All rights reserved.
//

import Foundation

extension Request {
    
    /**
        Get a notification subtitle and body message
     */
    func notificationDetails()  -> (subtitle:String, body:String) {
        switch self.body {
        case .ssh(let sshSign):
            return ("SSH Login", sshSign.display)
        case .git(let gitSign):
            let git = gitSign.git
            return (git.subtitle + " Signature", git.shortDisplay)
        case .me:
            return ("Identity Request", "Public key exported")
        case .unpair:
            return ("Unpair", "Device has been unpaired")
        case .hosts:
            return ("Access Logs", "Send username and hostnames from access logs?")
        case .noOp:
            return ("Ping", "")
        }
    }
    

}
