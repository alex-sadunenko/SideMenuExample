//
//  MenuOption.swift
//  SideMenuExample
//
//  Created by Alex on 05.09.2020.
//  Copyright © 2020 Alex Sadunenko. All rights reserved.
//

import Foundation
import UIKit

enum MenuOption: Int, CustomStringConvertible {
    
    //var debugDescription: String
    
    case Profile
    case Inbox
    case Notification
    case Settings
    
    var description: String {
        switch self {
        case .Profile:
            return "Profile"
        case .Inbox:
            return "Inbox"
        case .Notification:
            return "Notification"
        case .Settings:
            return "Settings"
        }
    }
    
    var image: UIImage {
        switch self {
        case .Profile:
            return UIImage(systemName: "person") ?? UIImage()
        case .Inbox:
            return UIImage(systemName: "envelope") ?? UIImage()
        case .Notification:
            return UIImage(systemName: "tray") ?? UIImage()
        case .Settings:
            return UIImage(systemName: "gear") ?? UIImage()
        }

    }
}
