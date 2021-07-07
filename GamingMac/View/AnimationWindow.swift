//
//  AnimationWindow.swift
//  GamingMac
//
//  Created by p-x9 on 2021/07/07.
//  
//

import Cocoa

class AnimationWindow: NSWindow {
    
    init(_ viewController:NSViewController) {
        let contentRect = NSScreen.main!.frame
        let styleMask: NSWindow.StyleMask = [.titled, .resizable, .borderless]
        let backingType: NSWindow.BackingStoreType = .buffered
        
        super.init(contentRect: contentRect, styleMask: styleMask, backing: backingType, defer: false)
        
        self.isMovableByWindowBackground = true
        self.contentViewController = viewController
        self.tabbingMode = .disallowed
        self.isRestorable = false
        self.hasShadow = false
        self.isOpaque = false
        self.styleMask.remove(.closable)
        
        self.backgroundColor = .clear
        
        self.isMovable = false
        self.titlebarAppearsTransparent = true
        self.titleVisibility = .hidden
        self.styleMask.remove(.titled)
        self.ignoresMouseEvents = true
        
        let windowLevelKey: CGWindowLevelKey = .statusWindow
        self.level = NSWindow.Level(rawValue: Int(CGWindowLevelForKey(windowLevelKey)))
        
        self.contentViewController!.view.frame = contentRect
    }
}
