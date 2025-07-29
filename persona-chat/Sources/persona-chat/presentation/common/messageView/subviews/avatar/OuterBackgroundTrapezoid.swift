//
//  OuterBackgroundTrapezoid.swift
//  persona-chat
//
//  Created by Paweł Kłosowicz on 10/07/2025.
//

import SwiftUI

struct OuterBackgroundTrapezoid: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let topLeft = CGPoint(x: rect.width * 0.02,
                              y: rect.height * 0.04)
        let bottomLeft = CGPoint(x: rect.width * 0.31,
                                 y: rect.height * 0.91)
        let topRight = CGPoint(x: rect.width * 0.89,
                               y: rect.height * 0.16)
        let bottomRight = CGPoint(x: rect.width * 0.97,
                                  y: rect.height * 0.70)
        path.move(to: topLeft)
        path.addLine(to: topRight)
        path.addLine(to: bottomRight)
        path.addLine(to: bottomLeft)
        path.closeSubpath()

        return path
    }
}
