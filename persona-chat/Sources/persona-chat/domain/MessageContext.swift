//
//  MessageContext.swift
//  persona-chat
//
//  Created by Paweł Kłosowicz on 29/07/2025.
//

import Foundation

public struct MessageContext {
    public let id: String
    public let sender: MessageSender
    public let messages: [Message]
    
    public init(id: String = UUID().uuidString, sender: MessageSender, messages: [Message]) {
        self.id = id
        self.sender = sender
        self.messages = messages
    }
}
