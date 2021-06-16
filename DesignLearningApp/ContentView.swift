//
//  ContentView.swift
//  Belajar
//
//  Created by Adimas Surya Perdana Putra on 11/06/21.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
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
