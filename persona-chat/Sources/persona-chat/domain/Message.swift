//
//  Message.swift
//  persona-chat
//
//  Created by Paweł Kłosowicz on 14/07/2025.
//

import Foundation

public struct Message: Identifiable {
    public let id: String
    let sender: MessageSender
    let content: MessageContent
    
    public init(id: String = UUID().uuidString,
                sender: MessageSender,
                content: MessageContent) {
        self.id = id
        self.sender = sender
        self.content = content
    }
}
