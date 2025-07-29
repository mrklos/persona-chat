//
//  IncommingView.swift
//  persona-chat
//
//  Created by Paweł Kłosowicz on 21/07/2025.
//

import SwiftUI

public struct IncommingView: View {
    
    @State private var size: CGSize = .zero
    let dotCount: Int = 3
    let innerConfig: MessageBackgroundTrapezoidConfiguration = .innerMessageBackgroundTrapezoid(showArrow: false)
    
    var contentPaddingTop: CGFloat {
        return innerConfig.paddingTop()
    }
    var contentPaddingBottom: CGFloat {
        return innerConfig.paddingBottom()
    }
    var contentPaddingLeading: CGFloat {
        return innerConfig.paddingLeading(self.size) + 3
    }
    var contentPaddingTrailing: CGFloat {
        return innerConfig.paddingTrailing()
    }
    
    public var body: some View {
        MessageBackgroundTrapezoid(config: innerConfig)
            .background(
                GeometryReader { proxy in
                    Color.clear
                        .preference(key: SizePreferenceKey.self, value: proxy.size)
                }
            )
            .onPreferenceChange(SizePreferenceKey.self) { size in
                self.size = size
            }
            .opacity(0.5)
            .overlay {
                TimelineView(.animation) { timeline in
                    let p = 1.5
                    let t = timeline.date.timeIntervalSinceReferenceDate.truncatingRemainder(dividingBy: p)
                    //counter 0..6
                    let phase = Int((t / p) * Double(dotCount * 2))
                    HStack(spacing: 6) {
                        ForEach(0..<dotCount, id: \.self) { idx in
                            Circle()
                                .foregroundStyle(.red)
                                .opacity(phase < dotCount ?
                                         idx < phase ? 1 : 0 :
                                            (phase - dotCount) > idx ? 0: 1)
                        }
                    }
                    
                }
                .padding(.top, contentPaddingTop)
                .padding(.bottom, contentPaddingBottom)
                .padding(.leading, contentPaddingLeading)
                .padding(.trailing, contentPaddingTrailing)
            }
    }
}
