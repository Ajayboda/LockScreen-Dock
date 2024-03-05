//
//  DockLiveActivity.swift
//  Dock
//
//  Created by Ajay Boda on 05/03/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct DockLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: DockAttributes.self) { context in
            // Lock screen/banner UI goes here
            DockView(addedShortcuts: context.attributes.addedLinks)
                .activityBackgroundTint(Color.clear)
                

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.center) {
                    DockView(addedShortcuts: context.attributes.addedLinks)
                }

            } compactLeading: {
               
            } compactTrailing: {
                
            } minimal: {
               
            }
//            .widgetURL(context.attributes.)
            .keylineTint(Color.black)
        }
    }
    
    @ViewBuilder
    func DockView(addedShortcuts: [AppLink]) -> some View {
        
        HStack(spacing: 0) {
            ForEach(addedShortcuts) { link in
                if let appURL = link.appURL {
                    Link(destination: appURL) {
                        Image(link.name)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .frame(maxWidth: .infinity)
                            .widgetURL(appURL)
                    }
                }
            }
        }
        .frame(height: 85)
        .background {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(.clear)
        }
    }
   
}

//extension DockAttributes {
//    fileprivate static var preview: DockAttributes {
//        DockAttributes(name: "World", addedLinks: <#[AppLink]#>)
//    }
//}

//extension DockAttributes.ContentState {
//    fileprivate static var smiley: DockAttributes.ContentState {
//        DockAttributes.ContentState(emoji: "😀")
//     }
//     
//     fileprivate static var starEyes: DockAttributes.ContentState {
//         DockAttributes.ContentState(emoji: "🤩")
//     }
//}
//
//#Preview("Notification", as: .content, using: DockAttributes.preview) {
//   DockLiveActivity()
//} contentStates: {
//    DockAttributes.ContentState.smiley
//    DockAttributes.ContentState.starEyes
//}
