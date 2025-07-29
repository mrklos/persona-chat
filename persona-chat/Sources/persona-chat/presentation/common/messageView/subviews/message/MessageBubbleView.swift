//
//  MessageBubbleView.swift
//  persona-chat
//
//  Created by Paweł Kłosowicz on 11/07/2025.
//
import SwiftUI

public struct MessageBubbleView<Content: View>: View {
    let outerBackgroundColor: Color?
    let innerBackgroundColor: Color?
    var showArrow: Bool = false
    @State var size: CGSize = .zero
    let innerTrapezoidPaddingTop: CGFloat = 3
    let innerTrapezoidPaddingBottom: CGFloat = 5
    let innerTrapezoidPaddingLeading: CGFloat = 5
    let innerTrapezoidPaddingTrailing: CGFloat = 20
    let outerConfig: MessageBackgroundTrapezoidConfiguration?
    let innerConfig: MessageBackgroundTrapezoidConfiguration?
    
    var contentPaddingTop: CGFloat {
        return innerTrapezoidPaddingTop + (innerConfig?.paddingTop() ?? 0)
    }
    var contentPaddingBottom: CGFloat {
        return innerTrapezoidPaddingBottom + (innerConfig?.paddingBottom() ?? 0)
    }
    var contentPaddingLeading: CGFloat {
        return innerTrapezoidPaddingLeading + (innerConfig?.paddingLeading(self.size) ?? 0) + 3
    }
    var contentPaddingTrailing: CGFloat {
        return innerTrapezoidPaddingTrailing + (innerConfig?.paddingTrailing() ?? 0)
    }
    
    @ViewBuilder
    let content: () -> Content
    
    public init(
        outerBackgroundColor: Color? = .white,
        innerBackgroundColor: Color? = .black,
        showArrow: Bool = false,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.outerBackgroundColor = outerBackgroundColor
        self.innerBackgroundColor = innerBackgroundColor
        self.showArrow = showArrow
        self.content = content
        if outerBackgroundColor != nil {
            self.outerConfig = MessageBackgroundTrapezoidConfiguration.outerMessageBackgroundTrapezoid(showArrow: showArrow)
        } else { self.outerConfig = nil }
        if innerBackgroundColor != nil {
            self.innerConfig = MessageBackgroundTrapezoidConfiguration.innerMessageBackgroundTrapezoid(showArrow: showArrow)
        } else { self.innerConfig = nil }
    }
    
    @ViewBuilder
    public var body: some View {
        content()
            .onGeometryChange(for: CGSize.self, of: \.size) {
                self.size = $0
            }
            .padding(.top, contentPaddingTop)
            .padding(.bottom, contentPaddingBottom)
            .padding(.leading, contentPaddingLeading)
            .padding(.trailing, contentPaddingTrailing)
            .background {
                ZStack {
                    if let outerBackgroundColor,
                       let outerConfig {
                        MessageBackgroundTrapezoid(config: outerConfig)
                            .fill(outerBackgroundColor)
                    }
                    if let innerBackgroundColor,
                       let innerConfig {
                        MessageBackgroundTrapezoid(config: innerConfig)
                            .fill(innerBackgroundColor)
                            .padding(.top, innerTrapezoidPaddingTop)
                            .padding(.bottom, innerTrapezoidPaddingBottom)
                            .padding(.leading, innerTrapezoidPaddingLeading)
                            .padding(.trailing, innerTrapezoidPaddingTrailing)
                    }
                }
            }
    }
}
