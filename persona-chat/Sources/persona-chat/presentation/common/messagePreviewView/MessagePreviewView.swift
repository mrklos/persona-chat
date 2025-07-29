//
//  MessagePreviewView.swift
//  persona-chat
//
//  Created by Paweł Kłosowicz on 23/07/2025.
//

import SwiftUI

public struct MessagePreviewView: View {
    var message: MessagePreview
    var outerBackgroundColor: Color = .white
    var innerBackgroundColor: Color = .black
    
    public init(message: MessagePreview,) {
        self.message = message
    }
    
    public var body: some View {
        HStack(spacing: 0) {
                MessageAvatarView()
                    .frame(width: 120, height: 90)
            VStack(alignment: .leading, spacing: -20) {
                    HStack(spacing: -35) {
                        MessageBubbleView(outerBackgroundColor: innerBackgroundColor, innerBackgroundColor: outerBackgroundColor, showArrow: false) {
                            Text(getDay())
                                .font(.system(size: 12,
                                              weight: .bold))
                                .foregroundColor(.black)
                                .lineLimit(1)
                        }
                        MessageBubbleView(outerBackgroundColor: innerBackgroundColor, innerBackgroundColor: outerBackgroundColor, showArrow: false) {
                            Text(getMonth())
                                .font(.system(size: 12,
                                              weight: .bold))
                                .foregroundColor(.black)
                                .lineLimit(1)
                        }
                        MessageBubbleView(outerBackgroundColor: innerBackgroundColor, innerBackgroundColor: outerBackgroundColor, showArrow: false) {
                            Text(getWeekDay())
                                .font(.system(size: 12,
                                              weight: .bold))
                                .foregroundColor(.black)
                                .lineLimit(1)
                        }
                    }
                    MessageBubbleView(outerBackgroundColor: .clear,
                                      innerBackgroundColor: innerBackgroundColor, showArrow: false) {
                        switch message.content {
                        case .text(let text):
                            Text(text)
                                .font(.system(size: 12,
                                              weight: .bold))
                                .foregroundColor(outerBackgroundColor)
                                .lineLimit(1)
                            
                        case .image(let image):
                            image
                                .resizable()
                                .scaledToFit()
                        }
                    }
                                      .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
    
    private func getDay() -> String {
        let calendar = Calendar.autoupdatingCurrent
        let day = calendar.component(.day, from: message.date)
        return "\(day)/"
    }
    private func getMonth() -> String {
        let calendar = Calendar.autoupdatingCurrent
        let month = calendar.component(.month, from: message.date)
        return "\(month)"
    }
    private func getWeekDay() -> String {
        let calendar = Calendar.autoupdatingCurrent
        let idx = calendar.component(.weekday, from: message.date) - 1
        let symbols = DateFormatter().locale.calendar.veryShortWeekdaySymbols
        return "\(symbols[idx])"
    }
}
