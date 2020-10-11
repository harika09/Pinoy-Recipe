//
//  Recipe_AppApp.swift
//  Recipe App
//
//  Created by Harold Abella on 8/22/20.
//

import SwiftUI

@main
struct Recipe_AppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
