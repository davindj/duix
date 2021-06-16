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
                PageCourse()
                    .tabItem {
                        Image(systemName: "point.topleft.down.curvedto.point.bottomright.up")
                        Text("Path")
                    }
                
                PageCourse()
                    .tabItem {
                        Image(systemName: "book.closed.fill")
                        Text("Materials")
                    }
                
                PageCourse()
                    .tabItem {
                        Image(systemName: "paintpalette.fill")
                        Text("Reference")
                    }
                
                PageCourse()
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
