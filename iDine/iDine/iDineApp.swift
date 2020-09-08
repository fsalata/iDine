//
//  iDineApp.swift
//  iDine
//
//  Created by Fábio Salata on 07/09/20.
//

import SwiftUI

@main
struct iDineApp: App {
    var body: some Scene {
        WindowGroup {
            AppView()
                .environmentObject(Order())
                .environmentObject(Favorite())
        }
    }
}
