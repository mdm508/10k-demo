//
//  Chinese10kApp.swift
//  Chinese10k
//
//  Created by m on 6/6/23.
//

import SwiftUI
import SwiftData

@main
struct Chinese10kApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
