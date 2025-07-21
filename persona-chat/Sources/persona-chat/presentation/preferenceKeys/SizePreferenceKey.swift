//
//  SizePreferenceKey.swift
//  persona-chat
//
//  Created by Paweł Kłosowicz on 21/07/2025.
//

import SwiftUI

struct SizePreferenceKey: PreferenceKey {
    nonisolated(unsafe) static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}
