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
        ZStack{
            
            TabView {
                LearningPathNav()
                    .tabItem {
                        Image(systemName: "point.topleft.down.curvedto.point.bottomright.up")
                        Text("Path")
                    }
                
                MaterialsNav()
                    .tabItem {
                        Image(systemName: "book.closed.fill")
                        Text("Materials")
                    }
                
                DesignReferencesNav()
                    .tabItem {
                        Image(systemName: "paintpalette.fill")
                        Text("Reference")
                    }
                
                UserProfilesNav()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
