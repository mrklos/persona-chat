//
//  Message.swift
//  persona-chat
//
//  Created by Paweł Kłosowicz on 14/07/2025.
//

import Foundation

public struct Message: Identifiable {
    public let id: String
    public let content: MessageContent
    public let sentByCurrentUser: Bool
    public let sentAt: Date
    
    public init(id: String = UUID().uuidString,
                content: MessageContent,
                sentByCurrentUser: Bool,
                sentAt: Date) {
        self.id = id
        self.content = content
        self.sentByCurrentUser = sentByCurrentUser
        self.sentAt = sentAt
    }
}
