//
//  PrivateChatSwiftUiApp.swift
//  PrivateChatSwiftUi
//
//  Created by Fairooz P on 16/11/22.
//

import SwiftUI

@main
struct PrivateChatSwiftUiApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
