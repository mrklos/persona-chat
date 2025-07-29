//
//  MessagePreview.swift
//  persona-chat
//
//  Created by Paweł Kłosowicz on 23/07/2025.
//

import Foundation

public struct MessagePreview: Identifiable {
    public let id: String
    public let contextID: String
    public let sender: MessageSender
    public let content: MessageContent
    public let date: Date
    public let seen: Bool
    
    public init(id: String = UUID().uuidString,
                contextID: String,
                sender: MessageSender,
                content: MessageContent,
                date: Date,
                seen: Bool) {
        self.id = id
        self.contextID = contextID
        self.sender = sender
        self.content = content
        self.date = date
        self.seen = seen
    }
}
