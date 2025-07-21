//
//  LineView.swift
//  persona-chat
//
//  Created by Paweł Kłosowicz on 21/07/2025.
//

import SwiftUI

public struct LineView: View {
    let lineWidth: CGFloat = 16
    let shadowOffset: CGFloat = 6
    let anchors: MessageAnchorPreferenceKey.Value
    
    init(anchors: MessageAnchorPreferenceKey.Value) {
        self.anchors = anchors
    }
    
    public var body: some View {
        GeometryReader { geo in
            Canvas { context, size in
                let pts = anchors.map { geo[$0] }
                guard pts.count > 1 else { return }
                
                var mainPath = Path()
                var shadowPath = Path()
                
                for i in 0..<pts.count-1 {
                    let p0 = pts[i]
                    let p1 = pts[i+1]
                    if i == 0 {
                        mainPath.move(to: p0)
                    }
                    mainPath.addLine(to: p1)
                    let dx = p1.x - p0.x
                    let dy = p1.y - p0.y
                    let len = hypot(dx, dy)
                    guard len > 0 else { continue }
                    let (nx, ny): (CGFloat, CGFloat)
                    if dx < 0 {
                        nx =  dy / len
                        ny = -dx / len
                    } else {
                        nx = -dy / len
                        ny =  dx / len
                    }
                    let sp0 = CGPoint(x: p0.x + nx * shadowOffset,
                                      y: p0.y + ny * shadowOffset)
                    let sp1 = CGPoint(x: p1.x + nx * shadowOffset,
                                      y: p1.y + ny * shadowOffset)
                    if i == 0 {
                        shadowPath.move(to: sp0)
                    }
                    shadowPath.addLine(to: sp1)
                }
                context.stroke(shadowPath,
                               with: .color(.gray.opacity(0.8)),
                               lineWidth: lineWidth)
                context.stroke(mainPath,
                               with: .color(.black),
                               lineWidth: lineWidth)
            }
        }
    }
}
