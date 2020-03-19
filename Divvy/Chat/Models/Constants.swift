//
//  Constants.swift
//  Divvy
//
//  Created by Bo on 3/18/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import Foundation
import UIKit

struct K {
    static let appName = "Divvy"
    static let cellIdentifier = "ReusableChatCell"
    static let cellNibName = "MessageCell"
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
