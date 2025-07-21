//
//  MessageAvatarView.swift
//  persona-chat
//
//  Created by Paweł Kłosowicz on 09/07/2025.
//

import SwiftUI

struct MessageAvatarView: View {
    var avatar: UIImage?
    var outerBackgroundColor: Color = .black
    var innerBackgroundColor: Color = .white
    var avatarBackgroundColor: Color = .cyan
    
    var body: some View {
        ZStack {
            OuterBackgroundTrapezoid()
                .fill(outerBackgroundColor)
            InnerBackgroundTrapezoid()
                .fill(innerBackgroundColor)
            AvatarBackgroundTrapezoid()
                .fill(avatarBackgroundColor)
        }
    }
}
