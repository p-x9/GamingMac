//
//  AppDelegate.swift
//  GamingMac
//
//  Created by p-x9 on 2021/07/07.
//  
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    private let statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    private var mainViewController:NSViewController!
    private var animationWindow:AnimationWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        setupAnimationView()
        
        setupStatusBarButton()
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func setupStatusBarButton(){
        if let statusBarButton = statusBarItem.button{
            statusBarButton.image = NSImage(systemSymbolName: "scribble", accessibilityDescription: nil)
        }
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "終了", action: #selector(NSApplication.shared.terminate(_:)), keyEquivalent: "q"))
        statusBarItem.menu = menu
    }

    func setupAnimationView(){
        mainViewController = NSStoryboard.init(name: "Main", bundle: nil).instantiateController(identifier: "MainVC")
        mainViewController.view.frame = NSScreen.main!.frame
        animationWindow = AnimationWindow(mainViewController)
        
        let windowController = NSWindowController(window: animationWindow)
        windowController.showWindow(self)
    }

}

