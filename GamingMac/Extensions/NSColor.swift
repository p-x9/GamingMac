//
//  NSColor.swift
//  GamingMac
//
//  Created by p-x9 on 2021/07/07.
//  
//

import Cocoa

extension NSColor{
    static func rainbow()->[CGColor]{
        var colors:[CGColor] = []
        let increment:CGFloat = 0.02
        for hue:CGFloat in stride(from: 0.0, to: 1.0, by: increment) {
            let color = NSColor(hue: hue, saturation: 1.0, brightness: 1.0, alpha: 1.0)
            colors.append(color.cgColor)
        }
        return colors
    }
}
