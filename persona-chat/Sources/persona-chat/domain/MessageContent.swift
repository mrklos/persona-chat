//
//  MessageContent.swift
//  persona-chat
//
//  Created by Paweł Kłosowicz on 14/07/2025.
//

import SwiftUI

public enum MessageContent {
    case text(String)
    case image(Image)
    
    public init (_ text: String) {
        self = .text(text)
    }
    public init (_ image: Image) {
        self = .image(image)
    }
}
