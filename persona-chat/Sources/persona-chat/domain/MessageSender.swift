//
//  MessageSender.swift
//  persona-chat
//
//  Created by Paweł Kłosowicz on 14/07/2025.
//

import SwiftUI

public struct MessageSender: Identifiable {
    public let id: String
    public let displayName: String
    public let avatar: Image?
    
    public init(id: String = UUID().uuidString, displayName: String, avatar: Image? = nil) {
        self.id = id
        self.displayName = displayName
        self.avatar = avatar
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(displayName)
    }
}
