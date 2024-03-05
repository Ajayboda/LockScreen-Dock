//
//  HomeView.swift
//  LockScreen Dock
//
//  Created by Ajay Boda on 05/03/24.
//

import SwiftUI
import ActivityKit
import WidgetKit

struct HomeView: View {
    
    @State var addedShortcut: [AppLink] = []
    @State var availableAppLinks: [AppLink] = []
    
    var body: some View {
        List {
            Section {
                
                HStack(spacing: 0) {
                    ForEach(addedShortcut) { link in
                        Image(link.name)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .frame(maxWidth: .infinity)
                            .onTapGesture {
                                withAnimation(.snappy) {
                                    addedShortcut.removeAll(where: {$0 == link})
                                }
                            }
                    }
                }
                .frame(height: 85)
                
            } header: {
                Text("preview")
            }
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            Section {
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack(spacing: 15) {
                        ForEach(availableAppLinks.filter({!addedShortcut.contains($0)}), id: \.id) { link in
                            VStack(spacing: 8) {
                                Image(link.name)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 60, height: 60)
                                Text(link.name)
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                            
                            .contentShape(.rect)
                            .onTapGesture {
                                withAnimation(.snappy) {
                                    if !addedShortcut.contains(where: { $0.id == link.id }) {
                                        addedShortcut.append(link)
                                    }
                                }
                            }
                        }
                    }
                    .frame(height: 100)
                    .padding(.horizontal, 10)
                }
                .disabled(addedShortcut.count >= 4)
                .opacity(addedShortcut.count >= 4 ? 0.6 : 1)
                
            } header: {
                Text("Tap to add shortcuts")
            }
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            Button {
                addDockToLockScreen()
            } label: {
                HStack {
                    Text("Add Lockscreen Dock")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Image(systemName: "dock.rectangle")
                }
            }
            
            // MARK: Minimum two needed to add
            
            .disabled(addedShortcut.count < 2)
            .opacity(addedShortcut.count < 2 ? 0.6 : 1)
        }
        .onAppear {
            for link in appLinks {
                if let url = URL(string: link.deepLink) {
                    if UIApplication.shared.canOpenURL(url) {
                        var updatedLink = link
                        updatedLink.appURL = url
                        availableAppLinks.append(updatedLink)
                    }
                }
            }
        }
    }
    
    func addDockToLockScreen() {
        
        self.removeExitingDock()
        
        let activityAttribute =  DockAttributes(name: "LockScreen Dock", addedLinks: addedShortcut)
        
        let initialContentState = DockAttributes.ContentState()
        
        do {
            let activity = try Activity<DockAttributes>.request(attributes: activityAttribute, contentState: initialContentState)
            
            print("activity id \(activity.id)")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func removeExitingDock() {
        Task {
            for activity in Activity<DockAttributes>.activities {
                await activity.end(activity.content, dismissalPolicy: .immediate)
            }
        }
    }
}

#Preview {
    ContentView()
}
