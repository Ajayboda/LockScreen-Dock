//
//  AppLink.swift
//  LockScreen Dock
//
//  Created by Ajay Boda on 05/03/24.
//

import Foundation

struct AppLink: Identifiable, Equatable, Codable, Hashable {
    var id: UUID = .init ()
    var name: String
    var deepLink: String
    var status: Bool = false
    var appURL: URL?
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case deepLink
        case status
        case appURL
    }
}

var appLinks: [AppLink] = [
    .init(name: "Whatsapp", deepLink: "whatsapp://"),
    .init(name: "Instagram", deepLink: "instagram://"),
    .init(name: "Shortcut", deepLink: "shortcuts://"),
    .init(name: "Apple Maps", deepLink: "maps://"),
    .init(name: "Google Maps", deepLink: "comgooglemaps://"),
    .init(name: "Photos", deepLink: "photos-redirect://"),
    .init(name: "Linkedin", deepLink: "linkedin://"),
    .init(name: "Youtube", deepLink: "youtube://"),
    .init(name: "Video Lite", deepLink: "videolite://"),
    
    
    
]
