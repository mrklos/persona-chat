//
//  InnerBackgroundTrapezoid.swift
//  persona-chat
//
//  Created by Paweł Kłosowicz on 10/07/2025.
//

import SwiftUI

struct InnerBackgroundTrapezoid: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let topLeft = CGPoint(x: rect.width * 0.16,
                              y: rect.height * 0.085)
        let bottomLeft = CGPoint(x: rect.width * 0.35,
                                 y: rect.height * 0.79)
        let topRight = CGPoint(x: rect.width * 0.85,
                               y: rect.height * 0.20)
        let bottomRight = CGPoint(x: rect.width * 0.94,
                                  y: rect.height * 0.67)
        path.move(to: topLeft)
        path.addLine(to: topRight)
        path.addLine(to: bottomRight)
        path.addLine(to: bottomLeft)
        path.closeSubpath()

        return path
    }
}
