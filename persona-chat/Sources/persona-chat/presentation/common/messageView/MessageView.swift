//
//  MessageView.swift
//  persona-chat
//
//  Created by Paweł Kłosowicz on 11/07/2025.
//

import SwiftUI

public struct MessageView: View {
    var message: Message
    var sentByCurrentUser = false
    var outerBackgroundColor: Color = .white
    var innerBackgroundColor: Color = .black
    @State var zoomedIn: Bool = false
    
    public init(message: Message,
                sentByCurrentUser: Bool = false) {
        self.message = message
        self.sentByCurrentUser = sentByCurrentUser
    }
    
    public var body: some View {
        HStack(spacing: -35) {
            if !sentByCurrentUser {
                MessageAvatarView()
                    .frame(width: 120, height: 90)
            }
            MessageBubbleView(outerBackgroundColor: sentByCurrentUser ? innerBackgroundColor : outerBackgroundColor,
                              innerBackgroundColor: sentByCurrentUser ? outerBackgroundColor :  innerBackgroundColor, showArrow: !sentByCurrentUser) {
                switch message.content {
                case .text(let text):
                    Text(text)
                        .font(.system(size: 12,
                                      weight: .bold))
                        .foregroundColor(sentByCurrentUser ? innerBackgroundColor : outerBackgroundColor)
                        .multilineTextAlignment(.leading)
                    
                case .image(let image):
                    image
                        .resizable()
                        .scaledToFit()
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
            return sentByCurrentUser ? .bottomLeading : .leading
        case .image:
            return .center
        }
    }
}
