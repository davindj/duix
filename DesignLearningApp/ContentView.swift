//
//  ContentView.swift
//  DesignLearningApp
//
//  Created by David Tandjung on 04/06/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var showingSheet = false
    
    var body: some View {
        QuizView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
