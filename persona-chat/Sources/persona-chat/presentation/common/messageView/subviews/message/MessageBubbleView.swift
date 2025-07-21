//
//  MessageBubbleView.swift
//  persona-chat
//
//  Created by Paweł Kłosowicz on 11/07/2025.
//

import SwiftUI

public struct MessageBubbleView<Content: View>: View {
    let outerBackgroundColor: Color
    let innerBackgroundColor: Color
    var showArrow: Bool = true
    @State var size: CGSize = .zero
    
    @ViewBuilder
    let content: () -> Content
    
    public init(
        outerBackgroundColor: Color = .white,
        innerBackgroundColor: Color = .black,
        showArrow: Bool = true,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.outerBackgroundColor = outerBackgroundColor
        self.innerBackgroundColor = innerBackgroundColor
        self.showArrow = showArrow
        self.content = content
    }
    
    @ViewBuilder
    public var body: some View {
        content()
            .padding(.top, size.height * InnerMessageBackgroundTrapezoid.topLeftWeights.y)
            .padding(.bottom, size.height * (1-InnerMessageBackgroundTrapezoid.bottomLeftWeights.y))
            .padding(.leading, size.width * InnerMessageBackgroundTrapezoid.topLeftWeights.x)
            .padding(.trailing, size.width * (1-InnerMessageBackgroundTrapezoid.bottomRightWeights.x))
            .clipShape(                    InnerMessageBackgroundTrapezoid(showArrow: showArrow))
            .background(
                GeometryReader { proxy in
                    InnerMessageBackgroundTrapezoid(showArrow: showArrow)
                        .fill(innerBackgroundColor)
                        .preference(key: SizePreferenceKey.self, value: proxy.size)
                }
            )
            .background(
                OuterMessageBackgroundTrapezoid(showArrow: showArrow)
                    .fill(outerBackgroundColor)
            )
            .fixedSize(horizontal: false, vertical: true)
            .onPreferenceChange(SizePreferenceKey.self) { size in
                self.size = size
            }
    }
}

#Preview {
    VStack {
        MessageBubbleView {
            Text("test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test abcdefghijklmnqwerty w da d adawkd kawdk akdwkd kawk dakw kdak kwadk awdk akwd kad kakd kaw dkadk kad gjrdg djrgjdrg nrgjn sjfn aijnefija neijfn iajwenf iajwenf iajnfijna weiofj naewoifjn awiejfn aoijewnf iajwenf iajwnef oiajwen oiajnwefoi jnewoifj naweoijnf aowijenf oiajwenf oijanwfe oijawenf oijawnefoi jnaoeifjn aoiewjfn aoijwenf oaijenf oiajenf ijanwfij aneofijnaoeijfnaoijenf aoijenf oiajnewf oiajnewfo ijane ofijnaoeiwfjn aoiwejfn adadwdawda")
                .multilineTextAlignment(.leading)
            
                .colorInvert()
        }
        .background(.gray)
    }
}
