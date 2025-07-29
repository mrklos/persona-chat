//
//  DynamicHorizontalOffset.swift
//  persona-chat
//
//  Created by Paweł Kłosowicz on 21/07/2025.
//

import SwiftUI

struct DynamicHorizontalOffset: ViewModifier {
    let sentByCurrentUser: Bool
    let containerWidth: CGFloat
    @State var contentWidth: CGFloat = .zero
    
    func body(content: Content) -> some View {
        content
            .onGeometryChange(for: CGFloat.self) { proxy in
                proxy.size.width
            } action: { newValue in
                self.contentWidth = newValue
            }
            .frame(maxWidth: .infinity,
                   alignment: sentByCurrentUser ? .trailing : .leading)
            .offset(x: calculateOffset(fullWidth: containerWidth,
                                       contentWidth: contentWidth))
  }
    func calculateOffset(fullWidth: CGFloat,
                         contentWidth: CGFloat) -> CGFloat {
        if sentByCurrentUser {
            return 0
        } else {
            // Max offset should be set to 40% of center
            let leftover = (fullWidth - contentWidth) * 0.4
            // Some random for looking fancy
            let r = CGFloat.random(in: 0.4...0.8)
            return max(0, leftover * r)
        }
    }
}
