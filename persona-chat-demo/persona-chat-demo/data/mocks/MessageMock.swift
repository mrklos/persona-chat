//
//  Messages.swift
//  persona-chat-demo
//
//  Created by Paweł Kłosowicz on 29/07/2025.
//

import persona_chat

struct MessageMock {
    static let contexts: [MessageContext] = [
        MessageContext(sender: MessageSender(displayName: "Trickster"),
                          messages: [
                            Message(content: .text("The target’s vault code changes every 30 seconds. You in position?"),
                                    sentByCurrentUser: true,
                                    sentAt: .now),
                            Message(content: .text("Locked and loaded at the south corridor. Waiting on your signal."),
                                    sentByCurrentUser: false,
                                    sentAt: .now),
                            Message(content: .text("I’ll create the diversion in 3…2…1… now—smoke grenade activated."),
                                    sentByCurrentUser: true,
                                    sentAt: .now),
                            Message(content: .text("Copy that. Moving through the east hatch. Watch for patrol on your mark."),
                                    sentByCurrentUser: false,
                                    sentAt: .now),
                            Message(content: .text("Go! I’ve got eyes on the guard pattern—follow my lead and keep it silent."),
                                    sentByCurrentUser: true,
                                    sentAt: .now),
                            Message(content: .text("Vault’s open. Downloading the data now. Be ready to exfil in T‑minus minute."),
                                    sentByCurrentUser: false,
                                    sentAt: .now),
                            Message(content: .text("Download complete. Extraction point at the rooftop—see you in 60."),
                                    sentByCurrentUser: false,
                                    sentAt: .now)
                          ]),
        MessageContext(sender: MessageSender(displayName: "Fox"),
                          messages: [
                            Message(content: .text("Got the blueprints pinned to my HUD. Security grid cycles every 24 seconds."),
                                    sentByCurrentUser: true,
                                    sentAt: .now),
                            Message(content: .text("Copy that. I’m at the north tower vent—ready to slip inside on your go."),
                                    sentByCurrentUser: false,
                                    sentAt: .now),
                            Message(content: .text("Initiating noise decoy in 3…2…1… *boom*—blast charge deployed."),
                                    sentByCurrentUser: true,
                                    sentAt: .now),
                            Message(content: .text("Vent grate’s open. I’m moving in—no guards in sight so far."),
                                    sentByCurrentUser: false,
                                    sentAt: .now),
                            Message(content: .text("Go! I’ve got eyes on the guard pattern—follow my lead and keep it silent."),
                                    sentByCurrentUser: true,
                                    sentAt: .now),
                            Message(content: .text("Sync’d. Data stream’s active—patching through the firewall now."),
                                    sentByCurrentUser: false,
                                    sentAt: .now),
                            Message(content: .text("Firewall down. Data’s extracted. Rendezvous at the skylight in 45 seconds."),
                                    sentByCurrentUser: false,
                                    sentAt: .now),
                            Message(content: .text("On my way. Keep that comms jam live until I’m clear."),
                                    sentByCurrentUser: false,
                                    sentAt: .now),
                          ]),
        MessageContext(sender: MessageSender(displayName: "Ann"),
                          messages: [
                            Message(content: .text("Hey Echo, did you finish the history paper on the Metropolis Pact?"),
                                    sentByCurrentUser: false,
                                    sentAt: .now),
                            Message(content: .text("Barely—typed until 2 AM. My brain’s still stuck on those political factions. 😵"),
                                    sentByCurrentUser: true,
                                    sentAt: .now),
                            Message(content: .text("Same. Let’s trade notes at lunch by the cherry blossoms? I’ve got chart doodles you’ll love."),
                                    sentByCurrentUser: false,
                                    sentAt: .now),
                            Message(content: .text("Perfect. I’ll bring coffee—black, no sugar. You know I need fuel before presenting."),
                                    sentByCurrentUser: true,
                                    sentAt: .now),
                            Message(content: .text("Got it. And don’t forget the music for our project—“Midnight Rebellion” fit is spot on."),
                                    sentByCurrentUser: false,
                                    sentAt: .now),
                            Message(content: .text("On it. See you under the sakura tree at 12:15. Let’s ace this heist—I mean, presentation. 😉"),
                                    sentByCurrentUser: true,
                                    sentAt: .now),
                          ]),
    ]
    
    static var previews: [MessagePreview] {
        return MessageMock.contexts.map {
            if let lastMessage = $0.messages.last {
                return MessagePreview(contextID: $0.id,
                                      sender: $0.sender,
                                      content: lastMessage.content,
                                      date: lastMessage.sentAt,
                                      seen: Bool.random())
            } else {
                fatalError("No mock?")
            }
        }
    }
}
