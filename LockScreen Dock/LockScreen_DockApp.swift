//
//  LockScreen_DockApp.swift
//  LockScreen Dock
//
//  Created by Ajay Boda on 05/03/24.
//

import SwiftUI

@main
struct LockScreen_DockApp: App {
    @Environment(\.openURL) var openURL
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL(perform: { url in
//                    openURL(url)
                    UIApplication.shared.open(url, options: [:])
                })
        }
    }
}
