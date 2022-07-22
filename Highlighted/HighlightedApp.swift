//
//  HighlightedApp.swift
//  Highlighted
//
//  Created by denys pashkov on 22/07/22.
//

import SwiftUI

@main
struct HighlightedApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
