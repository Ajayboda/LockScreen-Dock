//
//  DockAttributes.swift
//  LockScreen Dock
//
//  Created by Ajay Boda on 05/03/24.
//

import Foundation
import ActivityKit

struct DockAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
//        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
    var addedLinks: [AppLink]
}
