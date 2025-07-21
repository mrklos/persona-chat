//
//  OuterMessageBackgroundTrapezoid.swift
//  persona-chat
//
//  Created by Paweł Kłosowicz on 11/07/2025.
//

import SwiftUI

struct OuterMessageBackgroundTrapezoid: Shape {
    
    let arrowWidth: CGFloat = 30
    let arrowHeight: CGFloat = 27
    var showArrow: Bool = true
    
    static let topLeftWeights = CGPoint(x: 0.105,
                                        y: 0.034)
    static let topRightWeights = CGPoint(x: 1,
                                         y: 0)
    static let bottomRightWeights = CGPoint(x: 0.92,
                                            y: 1)
    static let bottomLeftWeights = CGPoint(x: 0.05,
                                           y: 0.92)
    
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let topLeft = CGPoint(x: rect.width * OuterMessageBackgroundTrapezoid.topLeftWeights.x,
                              y: rect.height * OuterMessageBackgroundTrapezoid.topLeftWeights.y)
        let topRight = CGPoint(x: rect.width * OuterMessageBackgroundTrapezoid.topRightWeights.x,
                               y: 0 * OuterMessageBackgroundTrapezoid.topRightWeights.y)
        let bottomRight = CGPoint(x: rect.width * OuterMessageBackgroundTrapezoid.bottomRightWeights.x,
                                  y: rect.height * OuterMessageBackgroundTrapezoid.bottomRightWeights.y)
        let bottomLeft = CGPoint(x: rect.width * OuterMessageBackgroundTrapezoid.bottomLeftWeights.x,
                                 y: rect.height * OuterMessageBackgroundTrapezoid.bottomLeftWeights.y)
        path.move(to: topLeft)
        path.addLine(to: topRight)
        path.addLine(to: bottomRight)
        path.addLine(to: bottomLeft)
        if showArrow {
            let midPoint = CGPoint(x: (topLeft.x+bottomLeft.x)/2,
                                   y: (topLeft.y+bottomLeft.y)/2)
            let totalDY = bottomLeft.y - topLeft.y
            let t = arrowHeight / totalDY
            let topPoint = lerp(midPoint, topLeft, t: t)
            let bottomPoint = lerp(midPoint, bottomLeft, t: t)
            let arrow1 = CGPoint(x: midPoint.x - arrowWidth * 0.5,
                                 y: midPoint.y + arrowHeight * 0.68)
            let arrow2 = CGPoint(x: midPoint.x - arrowWidth * 0.60,
                                 y: midPoint.y + arrowHeight * 0.34)
            let arrow3 = CGPoint(x: midPoint.x - arrowWidth,
                                 y: midPoint.y + arrowHeight * 0.31)
            let arrow4 = CGPoint(x: midPoint.x - arrowWidth * 0.18,
                                 y: midPoint.y - arrowHeight * 0.58)
            let arrow5 = CGPoint(x: midPoint.x - arrowWidth * 0.13,
                                 y: midPoint.y - arrowHeight * 0.3)
            path.addLine(to: bottomPoint)
            path.addLine(to: arrow1)
            path.addLine(to: arrow2)
            path.addLine(to: arrow3)
            path.addLine(to: arrow4)
            path.addLine(to: arrow5)
            path.addLine(to: topPoint)
        }
        path.closeSubpath()
        
        return path
    }
    
    func lerp(_ a: CGPoint, _ b: CGPoint, t: CGFloat) -> CGPoint {
        return CGPoint(x: a.x + (b.x - a.x) * t,
                       y: a.y + (b.y - a.y) * t)
    }
    
}
