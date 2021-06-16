//
//  MaterialsHomeView.swift
//  DesignLearningApp
//
//  Created by Davin Djayadi on 16/06/21.
//

import SwiftUI

struct MaterialsHomeView: View {
    @State private var searchText = ""
    @FetchRequest(entity: Courses.entity(), sortDescriptors: []) var courses: FetchedResults<Courses>

    var body: some View {
        ScrollView{
            VStack{
                ForEach(courses){ course in
                    CourseItem(course: course)
                }
            }
            .padding(.top)
        }
        .padding(.leading , 18)
        .navigationTitle("Materials")
        .navigationBarTitleDisplayMode(.inline)
        .foregroundColor(Color("appSecondaryColor"))
    }
}

struct MaterialsHomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            MaterialsHomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
