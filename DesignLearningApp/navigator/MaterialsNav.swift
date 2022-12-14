//
//  MaterialsNav.swift
//  DesignLearningApp
//
//  Created by Adimas Surya Perdana Putra on 15/06/21.
//

import SwiftUI

struct MaterialsNav: View {
    var body: some View {
        NavigationView{
            MaterialsHomeView()
        }
    }
}

struct MaterialsNav_Previews: PreviewProvider {
    static var previews: some View {
        MaterialsNav().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
