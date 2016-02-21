//
//  Utils.swift
//  PartyQuest
//
//  Created by Josep Gonzalez Fernandez on 21/2/16.
//  Copyright © 2016 Josep Gonzalez Fernandez. All rights reserved.
//

import Foundation
import UIKit

class Utils {
    static func getCurrentStringDate() -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyy HH:mm:ss.SSS"
        return dateFormatter.stringFromDate(NSDate())
    }
}