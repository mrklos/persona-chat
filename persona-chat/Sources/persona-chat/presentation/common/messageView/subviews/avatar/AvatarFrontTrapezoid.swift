//
//  AvatarFrontTrapezoid.swift
//  persona-chat
//
//  Created by Paweł Kłosowicz on 10/07/2025.
//

import SwiftUI

struct AvatarFrontTrapezoid: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let topLeft = CGPoint(x: 0,
                              y: 0)
        let bottomLeft = CGPoint(x: rect.width * 0.37,
                                 y: rect.height * 0.74)
        let topRight = CGPoint(x: rect.width,
                               y: 0)
        let bottomRight = CGPoint(x: rect.width * 0.92,
                                  y: rect.height * 0.64)
        path.move(to: topLeft)
        path.addLine(to: topRight)
        path.addLine(to: bottomRight)
        path.addLine(to: bottomLeft)
        path.closeSubpath()

        return path
    }
}
