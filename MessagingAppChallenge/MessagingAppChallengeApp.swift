//
//  MessagingAppChallengeApp.swift
//  MessagingAppChallenge
//
//  Created by Marc Stroebel on 3/7/2022.
//

import SwiftUI
import StreetHawkCore_Pointzi

@main
struct MessagingAppChallengeApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            MessageListView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        Pointzi.sharedInstance().registerInstall(forApp: "MessagingApp", withDebugMode: true) {
            Pointzi.sharedInstance().tagCuid("mdstroebel@gmail.com")
        }
        return true
    }
}
