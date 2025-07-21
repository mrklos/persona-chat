//
//  MessageView.swift
//  persona-chat
//
//  Created by Paweł Kłosowicz on 11/07/2025.
//

import SwiftUI

public struct MessageView: View {
    var message: Message
    var isCurrentUserMessage = false
    var outerBackgroundColor: Color = .white
    var innerBackgroundColor: Color = .black
    @State var zoomedIn: Bool = false
    
    public init(message: Message,
                isCurrentUserMessage: Bool = false) {
        self.message = message
        self.isCurrentUserMessage = isCurrentUserMessage
    }
    
    public var body: some View {
        HStack(spacing: -12) {
            if !isCurrentUserMessage {
                MessageAvatarView()
                    .frame(width: 120, height: 90)
            }
            MessageBubbleView(outerBackgroundColor: isCurrentUserMessage ? innerBackgroundColor : outerBackgroundColor,
                              innerBackgroundColor: isCurrentUserMessage ? outerBackgroundColor :  innerBackgroundColor, showArrow: !isCurrentUserMessage) {
                switch message.content {
                case .text(let text):
                    Text(text)
                        .font(.system(size: 12,
                                      weight: .bold))
                        .foregroundColor(isCurrentUserMessage ? innerBackgroundColor : outerBackgroundColor)
                        .multilineTextAlignment(.leading)
                    
                case .image(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(InnerMessageBackgroundTrapezoid(showArrow:false))
                        .onTapGesture {
                            zoomedIn.toggle()
                        }
                }
            }
            .anchorPreference(
              key: MessageAnchorPreferenceKey.self,
              value: determineAnchorPlacement()
            ) { anchor in
                [anchor]
            }
        }
        .padding()
        .sheet(isPresented: $zoomedIn) {
            if case let .image(image) = message.content {
                image
                    .resizable()
                    .scaledToFit()
                    .onTapGesture {
                        zoomedIn.toggle()
                    }
            } else {
                EmptyView()
            }
        }
    }
    
    private func determineAnchorPlacement() -> Anchor<CGPoint>.Source {
        switch message.content {
            case .text:
            return isCurrentUserMessage ? .bottomLeading : .leading
        case .image:
            return .center
        }
    }
}

#Preview {
        MessageView(message: Message(sender: MessageSender(displayName: "Test",
                                                           avatar: nil),
                                     content: MessageContent("test ")))
    MessageView(message: Message(sender: MessageSender(displayName: "Test",
                                                       avatar: nil),
                                 content: MessageContent("test est est est set set sete tests test etst est setst est set setst ste setsetset ")))
        MessageView(message: Message(sender: MessageSender(displayName: "Test",
                                                           avatar: nil),
                                     content: MessageContent("test test test")), isCurrentUserMessage: true)
}
