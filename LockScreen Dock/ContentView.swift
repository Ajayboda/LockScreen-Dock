//
//  ContentView.swift
//  LockScreen Dock
//
//  Created by Ajay Boda on 05/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            HomeView()
                .navigationTitle("Lockscreen Dock")
        }
       
    }
}

#Preview {
    ContentView()
}
