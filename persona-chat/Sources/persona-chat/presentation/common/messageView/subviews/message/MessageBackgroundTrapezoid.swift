//
//  MessageBackgroundTrapezoid.swift
//  persona-chat
//
//  Created by Paweł Kłosowicz on 27/07/2025.
//

import SwiftUI

struct MessageBackgroundTrapezoidConfiguration {
    
    struct MessageBackgroundTrapezoidPoints {
        let tl: CGPoint
        let tr: CGPoint
        let br: CGPoint
        let bl: CGPoint
    }
    
    let showArrow: Bool
    let p: MessageBackgroundTrapezoidPoints
    let ap: [CGPoint]
    
    func paddingTop() -> CGFloat {
        max(p.tl.y, p.tr.y)
    }
    func paddingBottom() -> CGFloat {
        max(p.bl.y, p.br.y)
    }
    func paddingLeading(_ s: CGSize) -> CGFloat {
        if showArrow {
            let arrowSize = self.arrowSize(s)
            return max(p.tl.x+arrowSize.width,
                       p.bl.x+arrowSize.width)
        } else {
            return max(p.tl.x, p.bl.x)
        }
    }
    func paddingTrailing() -> CGFloat {
        max(p.tr.x, p.br.x)
    }
    func arrowSize(_ s: CGSize) -> CGSize {
        let power = 4.5
        let aspect = 1.0
        let h = power * pow(s.height, 0.4)
        let w = aspect * h
        return CGSize(width: w, height: h)
    }
    func tl(_ s: CGSize) -> CGPoint {
        CGPoint(x: p.tl.x, y: p.tl.y)
    }
    
    func tr(_ s: CGSize) -> CGPoint {
        CGPoint(x: s.width - p.tr.x, y: p.tr.y)
    }
    
    func br(_ s: CGSize) -> CGPoint {
        CGPoint(x: s.width - p.br.x, y: s.height - p.br.y)
    }
    
    func bl(_ s: CGSize) -> CGPoint {
        CGPoint(x: p.bl.x, y: s.height - p.bl.y)
    }
    
    
    static func innerMessageBackgroundTrapezoid(showArrow: Bool) -> MessageBackgroundTrapezoidConfiguration {
        MessageBackgroundTrapezoidConfiguration(showArrow: showArrow,
                                                p: MessageBackgroundTrapezoidPoints(tl: CGPoint(x: 10, y: 10),
                                                                                    tr: CGPoint(x: 0, y: 0),
                                                                                    br: CGPoint(x: 18, y: 0),
                                                                                    bl: CGPoint(x: 0, y: 8)),
                                                ap: [CGPoint(x: 0.05, y: 0.58),
                                              CGPoint(x: 0.55, y: 0.1),
                                              CGPoint(x: 0.65, y: 0.3),
                                                     CGPoint(x: 1, y: 0.1),
                                              CGPoint(x: 1, y: 0.65),
                                              CGPoint(x: 0.45, y: 0.75),
                                              CGPoint(x: 0.35, y: 0.45)])
    }
    
    static func outerMessageBackgroundTrapezoid(showArrow: Bool) -> MessageBackgroundTrapezoidConfiguration {
        MessageBackgroundTrapezoidConfiguration(showArrow: showArrow,
                                                p: MessageBackgroundTrapezoidPoints(tl: CGPoint(x: 10, y: 5),
                                                                                    tr: CGPoint(x: 0, y: 0),
                                                                                    br: CGPoint(x: 34, y: 0),
                                                                                    bl: CGPoint(x: 0, y: 10)), ap: [
                                                                                        CGPoint(x:0, y: 0.8),
                                                                                        CGPoint(x:0.65, y: 0),
                                                                                        CGPoint(x:0.70, y: 0.25),
                                                                                        CGPoint(x:1, y: 0.1),
                                                                                        CGPoint(x:1, y: 1),
                                                                                        CGPoint(x:0.26, y: 1.1),
                                                                                        CGPoint(x:0.24, y: 0.74)])
    }
}

struct MessageBackgroundTrapezoid: Shape {
    var config: MessageBackgroundTrapezoidConfiguration
    
    func path(in rect: CGRect) -> Path {
        let rect = config.showArrow ? CGRect(x: 0,
                                             y: 0,
                                             width: rect.width - config.arrowSize(rect.size).width,
                                             height: rect.height) : rect
        var path = Path()
        let topLeft = config.tl(rect.size)
        let bottomLeft =  config.bl(rect.size)
        path.move(to: topLeft)
        path.addLine(to: config.tr(rect.size))
        path.addLine(to: config.br(rect.size))
        path.addLine(to: bottomLeft)
        path.closeSubpath()
        if config.showArrow {
            appendArrow(&path,
                        in: rect,
                        topLeft: topLeft,
                        bottomLeft: bottomLeft)
        }
        return path
    }
    
    func appendArrow(_ path: inout Path, in rect: CGRect,
                     topLeft: CGPoint, bottomLeft: CGPoint) {
        guard config.ap.count > 1 else { return }
        let arrowSize = config.arrowSize(rect.size)
        
        let midPoint = CGPoint(
            x: (topLeft.x + bottomLeft.x) * 0.5,
            y: (topLeft.y + bottomLeft.y) * 0.5
        )
        let totalDY = bottomLeft.y - topLeft.y
        let t = arrowSize.height / totalDY
        let topPoint = lerp(midPoint, topLeft, t: t)
        let ar = CGRect(origin: .zero,
                        size: arrowSize)
        let arrowAnchor = CGPoint(x: ar.maxX, y: ar.midY)
        let dx = topPoint.x - arrowAnchor.x
        let dy = midPoint.y - arrowAnchor.y
        let arrowRect = ar.offsetBy(dx: dx, dy: dy)
        
        func p(_ fx: CGFloat, _ fy: CGFloat) -> CGPoint {
            return CGPoint(
                x: arrowRect.minX + fx * arrowRect.width,
                y: arrowRect.minY + fy * arrowRect.height
            )
        }
        var arrowPath = Path()
        for (i, ap) in config.ap.enumerated() {
            if i == 0 {
                arrowPath.move(to: p(ap.x, ap.y))
            } else {
                arrowPath.addLine(to: p(ap.x, ap.y))
            }
        }
        arrowPath.closeSubpath()
        path = path.union(arrowPath)
        path = path.offsetBy(dx: arrowSize.width, dy: 0)
    }
    
    func lerp(_ a: CGPoint, _ b: CGPoint, t: CGFloat) -> CGPoint {
        return CGPoint(x: a.x + (b.x - a.x) * t,
                       y: a.y + (b.y - a.y) * t)
    }
}
