//
//  DesignLearningAppApp.swift
//  DesignLearningApp
//
//  Created by David Tandjung on 04/06/21.
//

import SwiftUI

@main
struct DesignLearningAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
