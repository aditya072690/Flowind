//
//  FlowindApp.swift
//  Flowind
//
//  Created by Aditya chauhan on 11/01/25.
//
//
import SwiftUI
import SwiftData
import Firebase

@main
struct FlowindApp: App {
    init() {
           FirebaseApp.configure()
       }
    var body: some Scene {
                WindowGroup {
                    NavigationStack {
                        SplashScreen()
                    }
                }
            }
}
