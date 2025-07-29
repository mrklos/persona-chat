//
//  persona_chat_demoApp.swift
//  persona-chat-demo
//
//  Created by Paweł Kłosowicz on 29/07/2025.
//

import SwiftUI
import persona_chat

@main
struct persona_chat_demoApp: App {
    @State private var selectedMessageID: String? = nil
    @State private var path: [String] = []
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $path) {
                ChatsList(messages: MessageMock.previews,
                          selectedMessageContext: $selectedMessageID)
                .onChange(of: selectedMessageID, { oldValue, newValue in
                    guard let id = newValue else { return }
                    path.append(id)
                    selectedMessageID = nil
                })
                .navigationDestination(for: String.self) { id in
                    if let context = MessageMock.contexts.first(where: { $0.id == id }) {
                        ChatView(context: context)
                    } else {
                        Text("Unknown context ID: \(id)")
                    }
                }
            }.tint(.black) 
        }
    }
}
