//
//  ChatView.swift
//  persona-chat
//
//  Created by Paweł Kłosowicz on 14/07/2025.
//

import SwiftUI

public struct ChatView: View {
    @State private var fullWidth: CGFloat = .zero
    @State private var context: MessageContext
    @Binding var incomingMessage: Bool
    
    public init(context: MessageContext, incomingMessage: Binding<Bool> = .constant(false)) {
        self.context = context
        self._incomingMessage = incomingMessage
    }
    
    public var body: some View {
            ScrollView {
                ForEach(context.messages) { message in
                    MessageView(message: message,
                                sentByCurrentUser: message.sentByCurrentUser)
                    .modifier(DynamicHorizontalOffset(sentByCurrentUser: message.sentByCurrentUser, containerWidth: fullWidth))
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
