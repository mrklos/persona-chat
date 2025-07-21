//
//  ChatView.swift
//  persona-chat
//
//  Created by Paweł Kłosowicz on 14/07/2025.
//

import SwiftUI

public struct ChatView: View {
    @State private var fullWidth: CGFloat = .zero
    @State private var messages: [Message]
    @Binding var incomingMessage: Bool
    
    public init(messages: [Message] = [], incomingMessage: Binding<Bool> = .constant(false)) {
        self.messages = messages
        self._incomingMessage = incomingMessage
    }
    
    public var body: some View {
            ScrollView {
                ForEach(messages) { message in
                    MessageView(message: message,
                                isCurrentUserMessage: message.sender.isCurrentUser)
                    .modifier(DynamicHorizontalOffset(isCurrentUserMessage: message.sender.isCurrentUser, containerWidth: fullWidth))
                }
                if incomingMessage {
                    HStack {
                        IncommingView()
                            .frame(width: 60, height: 40)
                        Spacer()
                    }.padding()
                }
            }
            .onGeometryChange(for: CGFloat.self) { proxy in
                proxy.size.width
            } action: { newValue in
                self.fullWidth = newValue
            }
            .backgroundPreferenceValue(MessageAnchorPreferenceKey.self) { anchors in
                LineView(anchors: anchors)
            }
            .background(.red)
    }
}

#Preview {
    ChatView(messages: [
        Message(sender: MessageSender(displayName: "Test user"),
                content: MessageContent("Test")),
        Message(sender: MessageSender(displayName: "Test user"),
                content: MessageContent("Test Test Test")),
        Message(sender: MessageSender(displayName: "Test user"),
                content: MessageContent("Test Test Test Test Test")),
        Message(sender: MessageSender(displayName: "Test user"),
                content: MessageContent("Test Test Test Test")),
        Message(sender: MessageSender(displayName: "Test user", isCurrentUser: true),
                content: MessageContent("Test test test")),
        Message(sender: MessageSender(displayName: "Test user"),
                content: MessageContent("Test test text Test Test Test Test")),
        Message(sender: MessageSender(displayName: "Test user"),
                content: MessageContent("""
Test test            test test test test test test test test test stestests
                                        etsetestestest setestestesteststsetst
        testesteste estest
""")),
        Message(sender: MessageSender(displayName: "Test user", isCurrentUser: true),
                content: MessageContent("Test test test")),
        Message(sender: MessageSender(displayName: "Test user"),
                content: MessageContent("Test test text")),
    ], incomingMessage: .constant(true))
}

