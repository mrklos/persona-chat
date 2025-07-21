//
//  MessageSender.swift
//  persona-chat
//
//  Created by Paweł Kłosowicz on 14/07/2025.
//

import SwiftUI

public struct MessageSender {
    let displayName: String
    let avatar: Image?
    let isCurrentUser: Bool
    
    public init(displayName: String, avatar: Image? = nil, isCurrentUser: Bool = false) {
        self.displayName = displayName
        self.avatar = avatar
        self.isCurrentUser = isCurrentUser
    }
}
