//
//  MessageAnchorPreferenceKey.swift
//  persona-chat
//
//  Created by Paweł Kłosowicz on 21/07/2025.
//

import SwiftUI

struct MessageAnchorPreferenceKey: PreferenceKey {
    typealias Value = [Anchor<CGPoint>]

    nonisolated(unsafe) static var defaultValue: [Anchor<CGPoint>] = []

    static func reduce(value: inout [Anchor<CGPoint>], nextValue: () -> [Anchor<CGPoint>]) {
        value.append(contentsOf: nextValue())
    }
}
