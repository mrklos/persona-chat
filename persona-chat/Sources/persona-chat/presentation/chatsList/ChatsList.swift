//
//  ChatsList.swift
//  persona-chat
//
//  Created by Paweł Kłosowicz on 23/07/2025.
//

import SwiftUI

public struct ChatsList: View {
    @State private var fullWidth: CGFloat = .zero
    @State private var messages: [MessagePreview]
    @Binding public var selectedMessageContext: String?
    
    public init(messages: [MessagePreview] = [], selectedMessageContext: Binding<String?>) {
        self.messages = messages
        self.fullWidth = .zero
        self._selectedMessageContext = selectedMessageContext
    }
    
    public var body: some View {
        ScrollView {
            ForEach(messages) { message in
                MessagePreviewView(message: message)
                    .onTapGesture {
                        selectedMessageContext = message.contextID
                    }
            }
        }
        .onGeometryChange(for: CGFloat.self) { proxy in
            proxy.size.width
        } action: { newValue in
            self.fullWidth = newValue
        }
        .background(.red)
    }
}
