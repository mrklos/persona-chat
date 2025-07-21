//
//  InnerMessageBackgroundTrapezoid.swift
//  persona-chat
//
//  Created by Paweł Kłosowicz on 11/07/2025.
//

import SwiftUI

struct InnerMessageBackgroundTrapezoid: Shape {
    
    var arrowWidth: CGFloat = 30
    var arrowHeight: CGFloat = 17
    var showArrow: Bool = true
    
    static let topLeftWeights = CGPoint(x: 0.109,
                                 y: 0.08)
    static let topRightWeights = CGPoint(x: 0.956,
                                  y: 0.04)
    static let bottomRightWeights = CGPoint(x: 0.91,
                                     y: 0.95)
    static let bottomLeftWeights = CGPoint(x: 0.066,
                                    y: 0.88)
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let topLeft = CGPoint(x: rect.width * InnerMessageBackgroundTrapezoid.topLeftWeights.x,
                              y: rect.height * InnerMessageBackgroundTrapezoid.topLeftWeights.y)
        let topRight = CGPoint(x: rect.width * InnerMessageBackgroundTrapezoid.topRightWeights.x,
                               y: rect.height * InnerMessageBackgroundTrapezoid.topRightWeights.y)
        let bottomRight = CGPoint(x: rect.width * InnerMessageBackgroundTrapezoid.bottomRightWeights.x,
                                  y: rect.height * InnerMessageBackgroundTrapezoid.bottomRightWeights.y)
        let bottomLeft = CGPoint(x: rect.width * InnerMessageBackgroundTrapezoid.bottomLeftWeights.x,
                                 y: rect.height * InnerMessageBackgroundTrapezoid.bottomLeftWeights.y)
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
            let arrow1 = CGPoint(x: midPoint.x - arrowWidth * 0.54,
                y: midPoint.y + arrowHeight * 0.55)
            let arrow2 = CGPoint(x: midPoint.x - arrowWidth * 0.60,
                                 y: midPoint.y + arrowHeight * 0.05)
            let arrow3 = CGPoint(x: midPoint.x - arrowWidth * 0.93,
                                 y: midPoint.y + arrowHeight * 0.25)
            let arrow4 = CGPoint(x: midPoint.x - arrowWidth * 0.44,
                y: midPoint.y - arrowHeight * 0.57)
            let arrow5 = CGPoint(x: midPoint.x - arrowWidth * 0.32,
                y: midPoint.y - arrowHeight * 0.25)
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
